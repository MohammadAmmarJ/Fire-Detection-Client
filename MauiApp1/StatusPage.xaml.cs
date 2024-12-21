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
            _refreshTimer.Start();
        }

        protected override void OnDisappearing()
        {
            base.OnDisappearing();
            _refreshTimer.Stop();
        }

        private async void RefreshStatus(object? sender, System.Timers.ElapsedEventArgs e)
        {
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
                var response = await _httpClient.GetAsync($"http://{serverIp}:5000/status");
                if (response.IsSuccessStatusCode)
                {
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
            catch
            {
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
            ServerConnectivityLabel.TextColor = connected ? Colors.Green : Colors.Red;

            ConnectivityStatusIndicator.BackgroundColor = connected ? Colors.Green : Colors.Red;
            DetectionIndicator.BackgroundColor = lastDetection != "No Data" ? Colors.Orange : Colors.Gray;
            NotificationIndicator.BackgroundColor = notificationRunning ? Colors.Green : Colors.Red;

            LastDetectionLabel.Text = lastDetection;
            NotificationSocketLabel.Text = notificationRunning ? "Running" : "Not Running";
        }
    }
}
