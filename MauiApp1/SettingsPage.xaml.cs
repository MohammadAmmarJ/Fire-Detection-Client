namespace MauiApp1
{
    public partial class SettingsPage : ContentPage
    {
        public SettingsPage()
        {
            InitializeComponent();
        }

        private void OnNetworkOptionChanged(object sender, CheckedChangedEventArgs e)
        {
            // Enable or disable WAN settings based on WAN option selection
            WanSettingsSection.IsVisible = WanOption.IsChecked;
            WanIpEntry.IsEnabled = WanOption.IsChecked;
        }

        private async void OnConnectClicked(object sender, EventArgs e)
        {
            if (LanOption.IsChecked)
            {
                AppState.UseLan = true;
            }
            else if (WanOption.IsChecked)
            {
                AppState.UseLan = false;

                // Validate that the WAN IP entry is not empty
                if (string.IsNullOrEmpty(WanIpEntry.Text?.Trim()))
                {
                    await DisplayAlert("Error", "Please enter a WAN IP address.", "OK");
                    return;
                }

                // Validate the IP address format
                if (!IsValidIp(WanIpEntry.Text.Trim()))
                {
                    await DisplayAlert("Error", "Invalid IP address format.", "OK");
                    return;
                }

                AppState.ManualWanIp = WanIpEntry.Text.Trim();
            }
            else
            {
                await DisplayAlert("Error", "Please select a network option.", "OK");
                return;
            }

            await DisplayAlert("Settings Saved", "Your network settings have been saved.", "OK");
        }

        // Helper method to validate an IP address
        private bool IsValidIp(string ip)
        {
            return System.Net.IPAddress.TryParse(ip, out _);
        }
    }
}
