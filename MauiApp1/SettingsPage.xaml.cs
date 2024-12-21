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
            // Enable or disable WAN IP entry based on selected option
            WanIpEntry.IsEnabled = WanOption.IsChecked;

            // Save user choice to AppState
            AppState.UseLan = LanOption.IsChecked;
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

                // Validate WAN IP
                if (string.IsNullOrEmpty(WanIpEntry.Text?.Trim()))
                {
                    await DisplayAlert("Error", "Please enter a valid WAN IP address.", "OK");
                    return;
                }

                // Check if the input is a valid IP address
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

            await DisplayAlert("Settings Saved", "Network settings have been saved.", "OK");
        }

        // Helper method to validate IP address format
        private bool IsValidIp(string ip)
        {
            return System.Net.IPAddress.TryParse(ip, out _);
        }
    }
}
