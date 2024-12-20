using Android.App;
using Android.Content;
using Android.OS;
using AndroidX.Core.App;
using Android.Media;
using System.Runtime.Versioning; 
using System.Threading;
using System.Threading.Tasks;
using Android.Content.PM;
using Uri = Android.Net.Uri;

namespace MauiApp1.Platforms.Android
{
    //A foreground service for managing background notifications and alerts
    [Service(
        Exported = true,
        ForegroundServiceType = ForegroundService.TypeDataSync 
    )]
    [IntentFilter(new[] { ActionStart, ActionStop })] 
    [SupportedOSPlatform("android")]
    public class BackgroundNotificationService : Service
    {
        public const string ActionStart = "com.companyname.mauiapp1.action.START";
        public const string ActionStop = "com.companyname.mauiapp1.action.STOP";

        private const string FireChannelId = "FireIdChannel1";
        private const string DefaultChannelId = "DefaultChannelId1";
        private const int NotificationId = 234234215;
        private CancellationTokenSource? _resetCts;
        
        //Set up the notification channels
        public override void OnCreate()
        {
            base.OnCreate();
            CreateNotificationChannels();
        }
        //This service does not support binding,so this method returns null
        public override IBinder? OnBind(Intent? intent) => null;
        //Handles commands sent to the service,starts or stops the service
        public override StartCommandResult OnStartCommand(Intent? intent, StartCommandFlags flags, int startId)
        {
            if (intent?.Action == ActionStop)
            {
                StopForeground(true);
                StopSelf();
                return StartCommandResult.NotSticky;
            }

            string message = intent?.GetStringExtra("message") ?? "Service Running";

            // Start the service in the foreground
            StartForeground(NotificationId, CreateNotification(message));

            
            if (message != "Service Running")
            {
                ResetNotificationAfterDelay(30000);
            }

            return StartCommandResult.Sticky;
        }
        //Create a notification to be displayed in the foreground.
        private Notification CreateNotification(string message)
        {
            string channelId = (message.Contains("Fire") || message.Contains("Smoke"))
                ? FireChannelId
                : DefaultChannelId;

            // Adding a "Stop" action to the notification
            var stopIntent = new Intent(this, typeof(BackgroundNotificationService));
            stopIntent.SetAction(ActionStop);
            var stopPendingIntent = PendingIntent.GetService(
                this,
                0,
                stopIntent,
                PendingIntentFlags.UpdateCurrent | PendingIntentFlags.Immutable
            );

            return new NotificationCompat.Builder(this, channelId)
                .SetContentTitle("Fire Detection Alert")
                .SetContentText(message)
                .SetSmallIcon(Resource.Drawable.fire) 
                .SetPriority(NotificationCompat.PriorityHigh)
                .SetAutoCancel(true)
                .AddAction(
                    new NotificationCompat.Action.Builder(
                        Resource.Drawable.fire,
                        "Stop",
                        stopPendingIntent
                    ).Build())
                .Build();
        }
        //Creates notificcation channels.
        private void CreateNotificationChannels()
        {
            if (Build.VERSION.SdkInt >= BuildVersionCodes.O)
            {
                var notificationManager = (NotificationManager)GetSystemService(NotificationService);

                
                var fireSoundUri = Uri.Parse($"android.resource://{this.PackageName}/raw/alarm");

                var fireAudioAttributes = new AudioAttributes.Builder()
                    .SetContentType(AudioContentType.Sonification)
                    .SetUsage(AudioUsageKind.Notification)
                    .Build();

                var fireChannel = new NotificationChannel(
                    FireChannelId,
                    "Fire Detection Alerts",
                    NotificationImportance.High)
                {
                    Description = "Alerts for Fire and Smoke Detection"
                };
                fireChannel.SetSound(fireSoundUri, fireAudioAttributes);

                
                var defaultChannel = new NotificationChannel(
                    DefaultChannelId,
                    "Default Notifications",
                    NotificationImportance.Default)
                {
                    Description = "Default system notifications"
                };

                notificationManager?.CreateNotificationChannel(fireChannel);
                notificationManager?.CreateNotificationChannel(defaultChannel);
            }
        }
        //Resets the notification message after a specified delay.
        private void ResetNotificationAfterDelay(int delayMilliseconds)
        {
            _resetCts?.Cancel();
            _resetCts = new CancellationTokenSource();

            Task.Run(async () =>
            {
                try
                {
                    await Task.Delay(delayMilliseconds, _resetCts.Token);
                    UpdateNotification("Service Running");
                }
                catch (TaskCanceledException)
                {
                    
                }
            });
        }
        //Updates the notification with a new message.
        private void UpdateNotification(string message)
        {
            var notificationManager = (NotificationManager)GetSystemService(NotificationService);
            var notification = CreateNotification(message);
            notificationManager?.Notify(NotificationId, notification);
        }
        //Cleans up the resources and stops foreground mode.
        public override void OnDestroy()
        {
            base.OnDestroy();
            _resetCts?.Cancel(); 
            StopForeground(true); 
        }
    }
}
