using System.Net;
using ZXing.Net.Maui;

namespace MauiApp1
{
    public partial class SettingsPage : ContentPage
    {
        public SettingsPage()
        {
            InitializeComponent();
            barcodeReader.Options = new BarcodeReaderOptions
            {
                Formats = ZXing.Net.Maui.BarcodeFormat.QrCode,
                AutoRotate = true,
                Multiple = true,
            };
        }

        private void OnNetworkOptionChanged(object sender, CheckedChangedEventArgs e)
        {
            if (LanOption.IsChecked)
            {
                AppState.UseLan = true;
                DisplayAlert("Settings Saved", "LAN network settings have been saved.", "OK");
            }
        }

        private void OnScanButtonClicked(object sender, EventArgs e)
        {
            MainContent.IsVisible = false;
            CameraView.IsVisible = true;
            barcodeReader.IsEnabled = true;
        }

        private void OnCloseCameraClicked(object sender, EventArgs e)
        {
            MainContent.IsVisible = true;
            CameraView.IsVisible = false;
            barcodeReader.IsEnabled = false;
        }

        private void barcodeReader_BarcodesDetected(object sender, BarcodeDetectionEventArgs e)
        {
            var barcode = e.Results.FirstOrDefault()?.Value;
            if (!string.IsNullOrEmpty(barcode) && IsValidIp(barcode))
            {
                // Save the scanned IP to the AppState
                AppState.ManualWanIp = barcode;
                AppState.UseLan = false;

                Dispatcher.Dispatch(() =>
                {
                    barcodeReader.IsDetecting = false;
                    DisplayAlert("Settings Saved", $"Scanned IP: {barcode}", "OK");

                    // Return to main view
                    MainContent.IsVisible = true;
                    CameraView.IsVisible = false;
                    barcodeReader.IsEnabled = false;
                });
            }
            else
            {
                Dispatcher.Dispatch(() =>
                {
                    DisplayAlert("Error", "Invalid or no IP detected. Please scan a valid QR code.", "OK");
                });
            }
        }

        // Helper method to validate an IP address
        private bool IsValidIp(string ip)
        {
            return IPAddress.TryParse(ip, out _);
        }
    }
}
