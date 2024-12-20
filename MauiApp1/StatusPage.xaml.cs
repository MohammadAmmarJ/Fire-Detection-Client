using Microsoft.Maui.Controls;
using Microsoft.Maui.Dispatching;
using System;
using System.Net.Http;
using System.Threading.Tasks;
using Timer = System.Timers.Timer;

namespace MauiApp1
{
    public partial class StatusPage : ContentPage
    {
        private readonly Timer _refreshTimer;
        private readonly HttpClient _httpClient;

        public StatusPage()
        {
            InitializeComponent();

            _refreshTimer = new Timer(3000); // Refresh every 3 seconds
            _refreshTimer.Elapsed += RefreshStatus;
            _refreshTimer.AutoReset = true;

            _httpClient = new HttpClient();
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            Console.WriteLine("StatusPage OnAppearing: Starting timer.");
            _refreshTimer.Start();
        }

        protected override void OnDisappearing()
        {
            base.OnDisappearing();
            Console.WriteLine("StatusPage OnDisappearing: Stopping timer.");
            _refreshTimer.Stop();
        }

        private async void RefreshStatus(object? sender, System.Timers.ElapsedEventArgs e)
        {
            Console.WriteLine("StatusPage RefreshStatus triggered.");

            // Capture current state
            bool serverConnected = AppState.ServerConnected;
            string serverIp = AppState.ServerIp;
            string lastDetection = AppState.LastDetection;
            bool notificationRunning = AppState.NotificationRunning;

            if (!serverConnected || string.IsNullOrEmpty(serverIp) || serverIp == "Not Connected")
            {
                MainThread.BeginInvokeOnMainThread(() =>
                {
                    UpdateStatusUI("Not Connected", false, "No Data", false);
                });
                return;
            }

            try
            {
                // Perform network call on background thread
                var response = await _httpClient.GetAsync($"http://{serverIp}:5000/status");
                Console.WriteLine($"StatusPage received response: {response.StatusCode}");

                if (response.IsSuccessStatusCode)
                {
                    string serverResponse = await response.Content.ReadAsStringAsync();
                    Console.WriteLine($"StatusPage server response body: {serverResponse}");

                    
                    MainThread.BeginInvokeOnMainThread(() =>
                    {
                        UpdateStatusUI(serverIp, true, lastDetection, notificationRunning);
                    });
                }
                else
                {
                    MainThread.BeginInvokeOnMainThread(() =>
                    {
                        UpdateStatusUI("Not Connected", false, "No Data", false);
                    });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"StatusPage RefreshStatus exception: {ex.Message}");
                MainThread.BeginInvokeOnMainThread(() =>
                {
                    UpdateStatusUI("Not Connected", false, "No Data", false);
                });
            }
        }

        private void UpdateStatusUI(string serverIp, bool connected, string lastDetection, bool notificationRunning)
        {
            ServerIpLabel.Text = serverIp;
            ServerConnectivityLabel.Text = connected ? "Connected" : "Disconnected";
            LastDetectionLabel.Text = lastDetection;
            NotificationSocketLabel.Text = notificationRunning ? "Running" : "Not Running";
        }
    }
}
