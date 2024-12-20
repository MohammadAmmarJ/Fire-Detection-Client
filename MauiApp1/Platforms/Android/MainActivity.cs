using Android;
using Android.App;
using Android.Content.PM;
using Android.OS;
using Android.Runtime;
using System.Runtime.Versioning;

namespace MauiApp1
{
    [Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true,
              ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation,
              SupportsPictureInPicture = true,
              ScreenOrientation = ScreenOrientation.Portrait,
              LaunchMode = LaunchMode.SingleTask)]
    [SupportedOSPlatform("android")]
    public class MainActivity : MauiAppCompatActivity
    {
#if ANDROID
        const int RequestPostNotificationsId = 0;

        protected override void OnCreate(Bundle? savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            if (Build.VERSION.SdkInt >= BuildVersionCodes.Tiramisu)
            {
                if (CheckSelfPermission(Manifest.Permission.PostNotifications) != Permission.Granted)
                {
                    RequestPermissions(new[] { Manifest.Permission.PostNotifications }, RequestPostNotificationsId);
                }
            }

            // Change the status bar color
            if (Build.VERSION.SdkInt >= BuildVersionCodes.Lollipop)
            {
                Window.SetStatusBarColor(Android.Graphics.Color.ParseColor("#fcb607"));
            }
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Permission[] grantResults)
        {
            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);

            if (requestCode == RequestPostNotificationsId && grantResults.Length > 0)
            {
                if (grantResults[0] == Permission.Granted)
                {
                    Console.WriteLine("POST_NOTIFICATIONS permission granted.");
                }
                else
                {
                    Console.WriteLine("POST_NOTIFICATIONS permission denied.");
                }
            }
        }
#endif
    }
}
