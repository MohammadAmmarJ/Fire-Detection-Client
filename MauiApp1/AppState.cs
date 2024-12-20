namespace MauiApp1
{
    public static class AppState
    {
        public static bool ServerConnected { get; set; } = false;
        public static string ServerIp { get; set; } = "Not Connected";
        public static string LastDetection { get; set; } = "No Data";
        public static bool NotificationRunning { get; set; } = false;
    }
}
