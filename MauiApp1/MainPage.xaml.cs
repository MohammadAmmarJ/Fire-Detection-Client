using Microsoft.Maui.Controls;
using Microsoft.Maui.Dispatching;
using System;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

#if ANDROID
using Android.Content;
using MauiApp1.Platforms.Android;
#endif

namespace MauiApp1
{
    public partial class MainPage : ContentPage
    {
        private WebView _videoStreamWebView;
        private const string NotificationMessage = "Background service running";

        private string? _serverIp = null;
        private const int DiscoveryPort = 9999;
        private const string DiscoveryMessage = "FIRE_DETECTION_SERVER_DISCOVERY";
        private const string ResponseMessage = "FIRE_DETECTION_SERVER_RESPONSE";

        private HttpClient _httpClient = new HttpClient();
        private CancellationTokenSource? _pollingCts;
        private CancellationTokenSource? _resetNotificationCts;
        private int _previousStatus = 0;

        public MainPage()
        {
            InitializeComponent();

            _videoStreamWebView = new WebView
            {
                VerticalOptions = LayoutOptions.Fill,
                HorizontalOptions = LayoutOptions.Fill,
            };

#if ANDROID
    // Adjust website zoom level specifically for Android
    _videoStreamWebView.HandlerChanged += (sender, e) =>
    {
        if (_videoStreamWebView.Handler?.PlatformView is Android.Webkit.WebView nativeWebView)
        {
            nativeWebView.Settings.TextZoom = 100; 
            nativeWebView.Settings.LoadWithOverviewMode = true; // Adjust to fit the view
            nativeWebView.Settings.UseWideViewPort = true; // Enable viewport settings for better scaling
        }
    };
#endif
        }


        private async void StartButton_Clicked(object sender, EventArgs e)
        {
            await StartMonitoring();
            
        }

        private void StopButton_Clicked(object sender, EventArgs e)
        {
            StopMonitoring();
        }

        //Start monitoring by discovering the server,setting up the video stream, and initiating polling
        private async Task StartMonitoring()
        {
            StartButton.IsEnabled = false;
            StopButton.IsEnabled = true;

            NotificationLabel.Text = "Attempting to start monitoring...";
            NotificationLabel.TextColor = Colors.Gray;

            var serverIp = await DiscoverServer();
            if (string.IsNullOrEmpty(serverIp))
            {
                await DisplayAlert("Error", "Server not found on the local network.", "OK");
                NotificationLabel.Text = "Server not found.";
                NotificationLabel.TextColor = Colors.Red;

                StartButton.IsEnabled = true;
                StopButton.IsEnabled = false;
                return;
            }

            _serverIp = serverIp;
            AppState.ServerIp = serverIp;
            AppState.ServerConnected = true;

            var videoStreamUrl = $"http://{_serverIp}:5000/video_feed";

            MainThread.BeginInvokeOnMainThread(() =>
            {
                _videoStreamWebView.Source = videoStreamUrl;

                if (VideoContainer.Children.Count == 0)
                {
                    VideoContainer.Children.Add(_videoStreamWebView);
                }

                NotificationLabel.Text = "Monitoring started!";
                NotificationLabel.TextColor = Colors.Green;
                StartNotificationService("Background service running");
            });

            // Start polling detection status
            _pollingCts = new CancellationTokenSource();
            _ = PollDetectionStatusAsync(_pollingCts.Token);
        }

        //stop the monitoring by disabling the ui,clearing the video stream,and stopping background services
        private void StopMonitoring()
        {
            StartButton.IsEnabled = true;
            StopButton.IsEnabled = false;

            NotificationLabel.Text = "No Notifications";
            NotificationLabel.TextColor = Colors.Gray;

            // Clear the video stream
            VideoContainer.Children.Clear();

            MainThread.BeginInvokeOnMainThread(() =>
            {
                _videoStreamWebView.Source = null;
            });

            // Stop polling
            _pollingCts?.Cancel();
            _pollingCts = null;

            _previousStatus = 0;
            AppState.ServerConnected = false;
            AppState.ServerIp = "Not Connected";
            AppState.LastDetection = "No Data";
            AppState.NotificationRunning = false;

#if ANDROID
            var context = Android.App.Application.Context;
            var intent = new Intent(context, typeof(BackgroundNotificationService));
            context.StopService(intent);

            NotificationLabel.Text = "Notification Service Stopped";
            NotificationLabel.TextColor = Colors.Gray;
#endif
        }
        //Discover the server on the local network by broadcasting a udp massage
        //return the ip address of the server if found,otherwise ,null
        private async Task<string?> DiscoverServer()
        {
            try
            {
                using (var udpClient = new System.Net.Sockets.UdpClient())
                {
                    udpClient.EnableBroadcast = true;
                    var discoveryEndpoint = new System.Net.IPEndPoint(System.Net.IPAddress.Broadcast, DiscoveryPort);
                    byte[] discoveryBytes = System.Text.Encoding.UTF8.GetBytes(DiscoveryMessage);
                    await udpClient.SendAsync(discoveryBytes, discoveryBytes.Length, discoveryEndpoint);

                    var receiveTask = udpClient.ReceiveAsync();
                    var completedTask = await Task.WhenAny(receiveTask, Task.Delay(5000));

                    if (completedTask == receiveTask)
                    {
                        var result = await receiveTask;
                        string response = System.Text.Encoding.UTF8.GetString(result.Buffer);

                        if (response.StartsWith(ResponseMessage))
                        {
                            string serverIp = response.Substring(ResponseMessage.Length);
                            return serverIp;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error during server discovery: {ex.Message}");
            }

            return null;
        }
        //Polls the detection status from the server and update the ui accordingly
        private async Task PollDetectionStatusAsync(CancellationToken token)
        {
            while (!token.IsCancellationRequested)
            {
                try
                {
                    var response = await _httpClient.GetStringAsync($"http://{_serverIp}:5000/status");
                    if (int.TryParse(response, out int currentStatus))
                    {
                        if (currentStatus != _previousStatus && currentStatus != 0)
                        {
                            // Fire or smoke detected or both
                            string message = currentStatus switch
                            {
                                1 => "Fire Detected!",
                                2 => "Smoke Detected!",
                                3 => "Fire and Smoke Detected!",
                                _ => "No Detection"
                            };

                            MainThread.BeginInvokeOnMainThread(() =>
                            {
                                NotificationLabel.Text = message;
                                NotificationLabel.TextColor = currentStatus switch
                                {
                                    1 => Colors.Red,
                                    2 => Colors.Orange,
                                    3 => Colors.DarkRed,
                                    _ => Colors.Gray
                                };

                                AppState.LastDetection = message;
                                // Start the notification service
                                StartNotificationService(message);

                                // Reset the notification timer
                                ResetNotificationAfterDelay();
                            });
                        }

                        _previousStatus = currentStatus;
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error polling detection status: {ex.Message}");
                }

                await Task.Delay(1000, token);
            }
        }
        //Reset the notificcation label after a delay
        private void ResetNotificationAfterDelay()
        {
            // Cancel any previous reset operation
            _resetNotificationCts?.Cancel();

            // Create a new cancellation token source
            _resetNotificationCts = new CancellationTokenSource();

            // Start a delayed task to reset the label
            _ = Task.Run(async () =>
            {
                try
                {
                    await Task.Delay(30000, _resetNotificationCts.Token);
                    MainThread.BeginInvokeOnMainThread(() =>
                    {
                        NotificationLabel.Text = "No Detection";
                        NotificationLabel.TextColor = Colors.Gray;
                        AppState.LastDetection = "No Data";
                    });
                }
                catch (TaskCanceledException)
                {
                    
                }
            });
        }
        //Starts the background notification service.
        private void StartNotificationService(string message)
        {
#if ANDROID
            var context = Android.App.Application.Context;
            var intent = new Intent(context, typeof(BackgroundNotificationService));
            intent.PutExtra("message", message);

            if (Android.OS.Build.VERSION.SdkInt >= Android.OS.BuildVersionCodes.O)
            {
                context.StartForegroundService(intent);
            }
            else
            {
                context.StartService(intent);
            }

            AppState.NotificationRunning = true;
#endif
        }
    }
}
