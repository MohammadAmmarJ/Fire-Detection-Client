; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [356 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [712 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 207
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 275
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 310
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 226
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 40744412, ; 9: Xamarin.AndroidX.Camera.Lifecycle.dll => 0x26db5dc => 246
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 354
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 224
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 293
	i32 117431740, ; 17: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 18: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 293
	i32 122350210, ; 19: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 20: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 314
	i32 142721839, ; 21: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 22: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 23: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 24: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 249
	i32 176265551, ; 25: System.ServiceProcess => 0xa81994f => 132
	i32 176714968, ; 26: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 198
	i32 182336117, ; 27: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 295
	i32 184328833, ; 28: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 29: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 351
	i32 199333315, ; 30: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 352
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 243
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 34: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 269
	i32 230752869, ; 35: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 36: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 37: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 38: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 39: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 252
	i32 276479776, ; 40: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 41: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 271
	i32 280482487, ; 42: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 268
	i32 280992041, ; 43: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 323
	i32 291076382, ; 44: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 45: System.Net.Ping.dll => 0x11d123fd => 69
	i32 300686228, ; 46: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0x11ec1b94 => 176
	i32 317674968, ; 47: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 351
	i32 318968648, ; 48: Xamarin.AndroidX.Activity.dll => 0x13031348 => 234
	i32 321597661, ; 49: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 50: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 336
	i32 342366114, ; 51: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 270
	i32 344827588, ; 52: Microsoft.AspNetCore.ResponseCaching.Abstractions => 0x148da6c4 => 190
	i32 356389973, ; 53: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 335
	i32 360082299, ; 54: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 55: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 56: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 57: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 58: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 384051609, ; 59: Microsoft.AspNetCore.Routing.dll => 0x16e42999 => 191
	i32 385762202, ; 60: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 61: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 62: _Microsoft.Android.Resource.Designer => 0x17969339 => 355
	i32 403441872, ; 63: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 64: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 347
	i32 441335492, ; 65: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 253
	i32 442565967, ; 66: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 67: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 266
	i32 451504562, ; 68: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 69: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 70: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 71: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 72: System.dll => 0x1bff388e => 164
	i32 476646585, ; 73: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 268
	i32 486930444, ; 74: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 281
	i32 490002678, ; 75: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x1d34d8f6 => 183
	i32 498788369, ; 76: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 77: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 334
	i32 503918385, ; 78: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 328
	i32 513247710, ; 79: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 217
	i32 526420162, ; 80: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 81: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 314
	i32 530272170, ; 82: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 83: Microsoft.Extensions.Logging => 0x20216150 => 212
	i32 540030774, ; 84: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 85: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 86: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 87: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 88: Jsr305Binding => 0x213954e7 => 307
	i32 569601784, ; 89: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 304
	i32 577335427, ; 90: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 91: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 342
	i32 597488923, ; 92: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 93: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 94: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 610194910, ; 95: System.Reactive.dll => 0x245ed5de => 228
	i32 613668793, ; 96: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 97: Xamarin.AndroidX.CustomView => 0x2568904f => 258
	i32 627931235, ; 98: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 340
	i32 639843206, ; 99: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 264
	i32 643868501, ; 100: System.Net => 0x2660a755 => 81
	i32 662205335, ; 101: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 102: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 300
	i32 666292255, ; 103: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 241
	i32 672442732, ; 104: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 105: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 106: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 322
	i32 690569205, ; 107: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 108: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 316
	i32 693804605, ; 109: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 110: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 111: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 311
	i32 700358131, ; 112: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 113: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 337
	i32 709557578, ; 114: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 325
	i32 713568204, ; 115: MauiApp1.dll => 0x2a882fcc => 0
	i32 720511267, ; 116: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 315
	i32 722857257, ; 117: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 724146010, ; 118: Microsoft.AspNetCore.Authorization.Policy.dll => 0x2b29975a => 179
	i32 735137430, ; 119: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 120: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 121: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 231
	i32 759454413, ; 122: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 123: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 763346851, ; 124: Websocket.Client => 0x2d7fbfa3 => 229
	i32 775507847, ; 125: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 126: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 346
	i32 782533833, ; 127: Xamarin.Google.AutoValue.Annotations.dll => 0x2ea484c9 => 306
	i32 789151979, ; 128: Microsoft.Extensions.Options => 0x2f0980eb => 216
	i32 790371945, ; 129: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 259
	i32 804715423, ; 130: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 131: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 273
	i32 823281589, ; 132: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 133: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 134: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 135: System.Net.Quic => 0x31b69d60 => 71
	i32 839353180, ; 136: ZXing.Net.MAUI.Controls.dll => 0x3207835c => 320
	i32 843511501, ; 137: Xamarin.AndroidX.Print => 0x3246f6cd => 286
	i32 865465478, ; 138: zxing.dll => 0x3395f486 => 318
	i32 873119928, ; 139: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 140: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 141: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 142: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 143: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 144: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 349
	i32 928116545, ; 145: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 310
	i32 952186615, ; 146: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 147: Newtonsoft.Json => 0x38f24a24 => 226
	i32 956575887, ; 148: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 315
	i32 966729478, ; 149: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 308
	i32 967690846, ; 150: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 270
	i32 975236339, ; 151: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 152: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 153: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 154: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 155: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 156: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 157: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 210
	i32 1001831731, ; 158: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 159: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 290
	i32 1019214401, ; 160: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 161: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 206
	i32 1029334545, ; 162: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 324
	i32 1031528504, ; 163: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 309
	i32 1035644815, ; 164: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 239
	i32 1036536393, ; 165: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 166: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 167: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 277
	i32 1061503568, ; 168: Xamarin.Google.AutoValue.Annotations => 0x3f454250 => 306
	i32 1067306892, ; 169: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 170: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 171: Xamarin.Kotlin.StdLib => 0x409e66d8 => 312
	i32 1089187994, ; 172: Websocket.Client.dll => 0x40ebb09a => 229
	i32 1092741930, ; 173: Microsoft.AspNetCore.Server.Kestrel.Transport.Sockets.dll => 0x4121eb2a => 197
	i32 1098259244, ; 174: System => 0x41761b2c => 164
	i32 1099692271, ; 175: Microsoft.DotNet.PlatformAbstractions => 0x418bf8ef => 199
	i32 1106973742, ; 176: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 204
	i32 1110309514, ; 177: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 211
	i32 1112354281, ; 178: Microsoft.AspNetCore.Authentication.Abstractions => 0x424d2de9 => 176
	i32 1118262833, ; 179: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 337
	i32 1121599056, ; 180: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 276
	i32 1127624469, ; 181: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 214
	i32 1149092582, ; 182: Xamarin.AndroidX.Window => 0x447dc2e6 => 303
	i32 1168523401, ; 183: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 343
	i32 1170634674, ; 184: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 185: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 208
	i32 1175144683, ; 186: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 299
	i32 1178241025, ; 187: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 284
	i32 1203215381, ; 188: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 341
	i32 1204270330, ; 189: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 241
	i32 1208641965, ; 190: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 191: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1220193633, ; 192: Microsoft.Net.Http.Headers => 0x48baad61 => 225
	i32 1234928153, ; 193: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 339
	i32 1235881722, ; 194: Microsoft.AspNetCore.Server.Kestrel.Transport.Abstractions.dll => 0x49aa0efa => 196
	i32 1236289705, ; 195: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x49b048a9 => 183
	i32 1243150071, ; 196: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 304
	i32 1253011324, ; 197: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 198: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 323
	i32 1264511973, ; 199: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 294
	i32 1267360935, ; 200: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 298
	i32 1267908789, ; 201: Microsoft.AspNetCore.Routing => 0x4b92c0b5 => 191
	i32 1273260888, ; 202: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 250
	i32 1275534314, ; 203: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 316
	i32 1278448581, ; 204: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 238
	i32 1293217323, ; 205: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 261
	i32 1309188875, ; 206: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 207: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 303
	i32 1324164729, ; 208: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 209: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 210: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 211: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 353
	i32 1376866003, ; 212: Xamarin.AndroidX.SavedState => 0x52114ed3 => 290
	i32 1379779777, ; 213: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 214: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 215: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 254
	i32 1408764838, ; 216: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 217: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1414043276, ; 218: Microsoft.AspNetCore.Connections.Abstractions.dll => 0x5448968c => 180
	i32 1422545099, ; 219: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 220: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 321
	i32 1434145427, ; 221: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 222: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 308
	i32 1439761251, ; 223: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 224: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 225: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 226: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 227: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 228: es\Microsoft.Maui.Controls.resources => 0x57152abe => 327
	i32 1461234159, ; 229: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 230: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 231: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 232: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 240
	i32 1470490898, ; 233: Microsoft.Extensions.Primitives => 0x57a5e912 => 217
	i32 1479771757, ; 234: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 235: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 236: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 237: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 291
	i32 1493001747, ; 238: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 331
	i32 1514721132, ; 239: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 326
	i32 1521091094, ; 240: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 210
	i32 1536373174, ; 241: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 242: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 243: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 244: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 245: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 346
	i32 1551954004, ; 246: Microsoft.IO.RecyclableMemoryStream.dll => 0x5c80f054 => 218
	i32 1565862583, ; 247: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 248: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 249: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 250: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 251: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 260
	i32 1592978981, ; 252: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 253: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 309
	i32 1601112923, ; 254: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 255: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 256: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 257: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 280
	i32 1622358360, ; 258: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 259: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 302
	i32 1634654947, ; 260: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 261: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 264
	i32 1636350590, ; 262: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 257
	i32 1639515021, ; 263: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 264: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 265: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 266: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 267: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 296
	i32 1658251792, ; 268: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 305
	i32 1670060433, ; 269: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 252
	i32 1675553242, ; 270: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 271: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 272: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 273: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 274: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 275: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 276: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 313
	i32 1701541528, ; 277: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 278: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 273
	i32 1726116996, ; 279: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 280: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 281: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 248
	i32 1736233607, ; 282: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 344
	i32 1743415430, ; 283: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 322
	i32 1744735666, ; 284: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 285: System.IO.Pipelines.dll => 0x68139a0d => 227
	i32 1746316138, ; 286: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 287: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 288: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 289: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 290: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 291: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 295
	i32 1770582343, ; 292: Microsoft.Extensions.Logging.dll => 0x6988f147 => 212
	i32 1776026572, ; 293: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 294: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1777249951, ; 295: Microsoft.AspNetCore.Server.Kestrel.Core.dll => 0x69eeae9f => 194
	i32 1780572499, ; 296: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 297: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 338
	i32 1788241197, ; 298: Xamarin.AndroidX.Fragment => 0x6a96652d => 266
	i32 1793755602, ; 299: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 330
	i32 1808609942, ; 300: Xamarin.AndroidX.Loader => 0x6bcd3296 => 280
	i32 1813058853, ; 301: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 312
	i32 1813201214, ; 302: Xamarin.Google.Android.Material => 0x6c13413e => 305
	i32 1818569960, ; 303: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 285
	i32 1818787751, ; 304: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1819327070, ; 305: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 187
	i32 1824175904, ; 306: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 307: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 308: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 213
	i32 1842015223, ; 309: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 350
	i32 1847515442, ; 310: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 231
	i32 1853025655, ; 311: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 347
	i32 1858542181, ; 312: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 313: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 314: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 329
	i32 1879696579, ; 315: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 316: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 242
	i32 1888955245, ; 317: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 318: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1894524299, ; 319: Microsoft.DotNet.PlatformAbstractions.dll => 0x70ec258b => 199
	i32 1898237753, ; 320: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 321: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 322: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1928288591, ; 323: Microsoft.AspNetCore.Http.Abstractions => 0x72ef594f => 185
	i32 1939592360, ; 324: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 325: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 326: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 292
	i32 1968388702, ; 327: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 200
	i32 1983156543, ; 328: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 313
	i32 1985761444, ; 329: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 233
	i32 2003115576, ; 330: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 326
	i32 2011961780, ; 331: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 332: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 277
	i32 2025202353, ; 333: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 321
	i32 2031763787, ; 334: Xamarin.Android.Glide => 0x791a414b => 230
	i32 2045470958, ; 335: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 336: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 202
	i32 2052370377, ; 337: Microsoft.AspNetCore.Server.Kestrel.dll => 0x7a54afc9 => 193
	i32 2055257422, ; 338: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 272
	i32 2060060697, ; 339: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 340: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 325
	i32 2070888862, ; 341: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 342: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 209
	i32 2075706075, ; 343: Microsoft.AspNetCore.Http.Abstractions.dll => 0x7bb8c2db => 185
	i32 2079903147, ; 344: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 345: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2111797732, ; 346: Microsoft.AspNetCore.Server.Kestrel => 0x7ddf79e4 => 193
	i32 2127167465, ; 347: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 348: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143465592, ; 349: Microsoft.IO.RecyclableMemoryStream => 0x7fc2b078 => 218
	i32 2143790110, ; 350: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 351: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 352: Microsoft.Maui => 0x80bd55ad => 222
	i32 2169148018, ; 353: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 333
	i32 2181898931, ; 354: Microsoft.Extensions.Options.dll => 0x820d22b3 => 216
	i32 2182738860, ; 355: Microsoft.AspNetCore.Mvc.Core.dll => 0x8219f3ac => 189
	i32 2192057212, ; 356: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 213
	i32 2193016926, ; 357: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2193681939, ; 358: Microsoft.Extensions.Configuration.EnvironmentVariables.dll => 0x82c0ee13 => 203
	i32 2197979891, ; 359: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 207
	i32 2201107256, ; 360: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 317
	i32 2201231467, ; 361: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 362: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 215
	i32 2207618523, ; 363: it\Microsoft.Maui.Controls.resources => 0x839595db => 335
	i32 2217644978, ; 364: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 299
	i32 2222056684, ; 365: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2242871324, ; 366: Microsoft.AspNetCore.Http.dll => 0x85af801c => 184
	i32 2244775296, ; 367: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 281
	i32 2252106437, ; 368: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 369: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 370: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 371: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 201
	i32 2267999099, ; 372: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 232
	i32 2270573516, ; 373: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 329
	i32 2279755925, ; 374: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 288
	i32 2285293097, ; 375: Microsoft.AspNetCore.Mvc.Abstractions => 0x8836ce29 => 188
	i32 2293034957, ; 376: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 377: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 378: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 379: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 339
	i32 2305521784, ; 380: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 381: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 236
	i32 2320631194, ; 382: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2321784778, ; 383: Microsoft.AspNetCore.Mvc.Abstractions.dll => 0x8a639fca => 188
	i32 2340441535, ; 384: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 385: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 386: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 387: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 388: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 200
	i32 2378619854, ; 389: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 390: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 391: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 334
	i32 2401565422, ; 392: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 393: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 263
	i32 2408036941, ; 394: Microsoft.AspNetCore.Server.Kestrel.Transport.Sockets => 0x8f87ba4d => 197
	i32 2421380589, ; 395: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 396: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 250
	i32 2427813419, ; 397: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 331
	i32 2435356389, ; 398: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 399: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 400: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458592288, ; 401: Microsoft.AspNetCore.Authentication.Core => 0x928b2420 => 177
	i32 2458678730, ; 402: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 403: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 404: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 253
	i32 2471841756, ; 405: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 406: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 407: Microsoft.Maui.Controls => 0x93dba8a1 => 220
	i32 2483903535, ; 408: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 409: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 410: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 411: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 412: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 275
	i32 2522472828, ; 413: Xamarin.Android.Glide.dll => 0x9659e17c => 230
	i32 2537015816, ; 414: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 178
	i32 2538310050, ; 415: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 416: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 332
	i32 2562349572, ; 417: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 418: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 419: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 276
	i32 2581819634, ; 420: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 298
	i32 2585220780, ; 421: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 422: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 423: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 424: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 208
	i32 2593268061, ; 425: Microsoft.AspNetCore.Routing.Abstractions.dll => 0x9a92215d => 192
	i32 2593496499, ; 426: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 341
	i32 2594125473, ; 427: Microsoft.AspNetCore.Hosting.Abstractions => 0x9a9f36a1 => 182
	i32 2605712449, ; 428: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 317
	i32 2615233544, ; 429: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 267
	i32 2616218305, ; 430: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 214
	i32 2617129537, ; 431: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 432: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 433: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 257
	i32 2624644809, ; 434: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 262
	i32 2626831493, ; 435: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 336
	i32 2627185994, ; 436: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 437: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 438: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 271
	i32 2633959305, ; 439: Microsoft.AspNetCore.Http.Extensions.dll => 0x9cff0789 => 186
	i32 2663391936, ; 440: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 232
	i32 2663698177, ; 441: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 442: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 443: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 444: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 445: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 446: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 447: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 296
	i32 2715334215, ; 448: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 449: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 450: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 451: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 452: Xamarin.AndroidX.Activity => 0xa2e0939b => 234
	i32 2735172069, ; 453: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 454: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 178
	i32 2737747696, ; 455: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 240
	i32 2740948882, ; 456: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 457: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 458: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 342
	i32 2758225723, ; 459: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 221
	i32 2764765095, ; 460: Microsoft.Maui.dll => 0xa4caf7a7 => 222
	i32 2765824710, ; 461: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 462: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 311
	i32 2778768386, ; 463: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 301
	i32 2779977773, ; 464: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 289
	i32 2785988530, ; 465: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 348
	i32 2788224221, ; 466: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 267
	i32 2801831435, ; 467: Microsoft.Maui.Graphics => 0xa7008e0b => 224
	i32 2803228030, ; 468: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 469: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 327
	i32 2810250172, ; 470: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 254
	i32 2819470561, ; 471: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 472: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 473: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 289
	i32 2824502124, ; 474: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 475: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 340
	i32 2836739085, ; 476: Microsoft.AspNetCore.Hosting => 0xa915340d => 181
	i32 2838993487, ; 477: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 278
	i32 2849599387, ; 478: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2850549256, ; 479: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 187
	i32 2853208004, ; 480: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 301
	i32 2855708567, ; 481: Xamarin.AndroidX.Transition => 0xaa36a797 => 297
	i32 2861098320, ; 482: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 483: Microsoft.Maui.Essentials => 0xaa8a4878 => 223
	i32 2868488919, ; 484: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 485: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 235
	i32 2875164099, ; 486: Jsr305Binding.dll => 0xab5f85c3 => 307
	i32 2875220617, ; 487: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 488: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 265
	i32 2887636118, ; 489: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 490: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 491: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 492: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 493: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 494: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 495: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 209
	i32 2916838712, ; 496: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 302
	i32 2919462931, ; 497: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 498: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 237
	i32 2936416060, ; 499: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 500: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 501: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 502: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2965157864, ; 503: Xamarin.AndroidX.Camera.View => 0xb0bcb7e8 => 247
	i32 2968338931, ; 504: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 505: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978368250, ; 506: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0xb1864afa => 182
	i32 2978675010, ; 507: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 261
	i32 2987532451, ; 508: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 292
	i32 2991449226, ; 509: Xamarin.AndroidX.Camera.Core => 0xb24de48a => 245
	i32 2996646946, ; 510: Microsoft.AspNetCore.Http => 0xb29d3422 => 184
	i32 2996846495, ; 511: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 274
	i32 3000842441, ; 512: Xamarin.AndroidX.Camera.View.dll => 0xb2dd38c9 => 247
	i32 3016983068, ; 513: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 294
	i32 3017953105, ; 514: MauiApp1 => 0xb3e24f51 => 0
	i32 3023353419, ; 515: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 516: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 269
	i32 3033331042, ; 517: Microsoft.AspNetCore.Authentication.Core.dll => 0xb4ccf562 => 177
	i32 3036999524, ; 518: Microsoft.AspNetCore.Http.Extensions => 0xb504ef64 => 186
	i32 3038032645, ; 519: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 355
	i32 3047751430, ; 520: Xamarin.AndroidX.Camera.Core.dll => 0xb5a8ff06 => 245
	i32 3056245963, ; 521: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 291
	i32 3057625584, ; 522: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 282
	i32 3059408633, ; 523: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 524: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 525: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 526: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 333
	i32 3090735792, ; 527: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 528: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 529: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 530: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3113762169, ; 531: Microsoft.AspNetCore.Routing.Abstractions => 0xb9983d79 => 192
	i32 3121463068, ; 532: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 533: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 534: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 535: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 536: GoogleGson.dll => 0xbba64c02 => 175
	i32 3151576809, ; 537: Microsoft.AspNetCore.Mvc.Core => 0xbbd93ee9 => 189
	i32 3159123045, ; 538: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 539: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 540: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 283
	i32 3188578740, ; 541: Microsoft.Extensions.Configuration.EnvironmentVariables => 0xbe0dd9b4 => 203
	i32 3192346100, ; 542: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 543: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 544: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 545: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 546: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 260
	i32 3215347189, ; 547: zxing => 0xbfa64df5 => 318
	i32 3220365878, ; 548: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 549: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3228018376, ; 550: Microsoft.AspNetCore.ResponseCaching.Abstractions.dll => 0xc067a6c8 => 190
	i32 3251039220, ; 551: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 552: Xamarin.AndroidX.CardView => 0xc235e84d => 248
	i32 3265493905, ; 553: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 554: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 555: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 556: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 557: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286373667, ; 558: ZXing.Net.MAUI.dll => 0xc3e21523 => 319
	i32 3290767353, ; 559: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 560: System.Text.Encoding => 0xc4a8494a => 135
	i32 3300764913, ; 561: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 198
	i32 3303498502, ; 562: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 563: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 328
	i32 3316684772, ; 564: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 565: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 258
	i32 3317144872, ; 566: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 567: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 242
	i32 3345895724, ; 568: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 287
	i32 3346324047, ; 569: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 284
	i32 3357674450, ; 570: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 345
	i32 3358260929, ; 571: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 572: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 235
	i32 3362522851, ; 573: Xamarin.AndroidX.Core => 0xc86c06e3 => 255
	i32 3366347497, ; 574: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 575: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 288
	i32 3381016424, ; 576: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 324
	i32 3395150330, ; 577: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 578: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 579: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 259
	i32 3413944578, ; 580: Xamarin.AndroidX.Camera.Camera2.dll => 0xcb7ca902 => 244
	i32 3421170118, ; 581: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 202
	i32 3421580071, ; 582: Microsoft.AspNetCore.Server.Kestrel.Https => 0xcbf12b27 => 195
	i32 3421910702, ; 583: Xamarin.AndroidX.Camera.Camera2 => 0xcbf636ae => 244
	i32 3428513518, ; 584: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 205
	i32 3429136800, ; 585: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 586: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 587: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 262
	i32 3445260447, ; 588: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 589: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 219
	i32 3463511458, ; 590: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 332
	i32 3471940407, ; 591: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 592: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 593: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 345
	i32 3484440000, ; 594: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 344
	i32 3485117614, ; 595: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 596: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 597: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 251
	i32 3509114376, ; 598: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 599: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 600: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 601: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 602: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 603: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 604: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 352
	i32 3597029428, ; 605: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 233
	i32 3598340787, ; 606: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 607: System.Linq.dll => 0xd715a361 => 61
	i32 3611087749, ; 608: Microsoft.AspNetCore.Hosting.dll => 0xd73cd385 => 181
	i32 3624195450, ; 609: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 610: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 286
	i32 3633644679, ; 611: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 237
	i32 3638274909, ; 612: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 613: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 272
	i32 3643446276, ; 614: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 349
	i32 3643854240, ; 615: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 283
	i32 3645089577, ; 616: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3655397943, ; 617: Microsoft.AspNetCore.Server.Kestrel.Core => 0xd9e0f237 => 194
	i32 3657292374, ; 618: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 201
	i32 3660523487, ; 619: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 620: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3676461095, ; 621: Xamarin.AndroidX.Camera.Lifecycle => 0xdb225827 => 246
	i32 3682565725, ; 622: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 243
	i32 3684561358, ; 623: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 251
	i32 3697841164, ; 624: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 354
	i32 3700866549, ; 625: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3704054342, ; 626: Microsoft.AspNetCore.Server.Kestrel.Https.dll => 0xdcc76246 => 195
	i32 3706696989, ; 627: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 256
	i32 3716563718, ; 628: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 629: Xamarin.AndroidX.Annotation => 0xdda814c6 => 236
	i32 3724971120, ; 630: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 282
	i32 3731644420, ; 631: System.Reactive => 0xde6c6004 => 228
	i32 3732100267, ; 632: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 633: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 634: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 635: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751582913, ; 636: ZXing.Net.MAUI.Controls => 0xdf9c9cc1 => 320
	i32 3758424670, ; 637: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 204
	i32 3765508441, ; 638: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 215
	i32 3786282454, ; 639: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 249
	i32 3787005001, ; 640: Microsoft.AspNetCore.Connections.Abstractions => 0xe1b91c49 => 180
	i32 3792276235, ; 641: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 642: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 219
	i32 3802395368, ; 643: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 644: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 645: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 646: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 647: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 648: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 206
	i32 3842894692, ; 649: ZXing.Net.MAUI => 0xe50deb64 => 319
	i32 3844307129, ; 650: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 651: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 652: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 653: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 654: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 655: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 656: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 297
	i32 3888767677, ; 657: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 287
	i32 3889960447, ; 658: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 353
	i32 3896106733, ; 659: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 660: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 255
	i32 3901907137, ; 661: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3919979020, ; 662: Microsoft.AspNetCore.Server.Kestrel.Transport.Abstractions => 0xe9a6220c => 196
	i32 3920810846, ; 663: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 664: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 300
	i32 3928044579, ; 665: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 666: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 667: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 285
	i32 3945713374, ; 668: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 669: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 670: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 239
	i32 3959773229, ; 671: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 274
	i32 3980434154, ; 672: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 348
	i32 3987592930, ; 673: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 330
	i32 4003436829, ; 674: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 675: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 238
	i32 4023392905, ; 676: System.IO.Pipelines => 0xefd01a89 => 227
	i32 4025784931, ; 677: System.Memory => 0xeff49a63 => 62
	i32 4044155772, ; 678: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 225
	i32 4046471985, ; 679: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 221
	i32 4054681211, ; 680: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 681: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 682: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4078967171, ; 683: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 211
	i32 4094352644, ; 684: Microsoft.Maui.Essentials.dll => 0xf40add04 => 223
	i32 4099507663, ; 685: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 686: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 687: Xamarin.AndroidX.Emoji2 => 0xf479582c => 263
	i32 4102112229, ; 688: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 343
	i32 4125707920, ; 689: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 338
	i32 4126470640, ; 690: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 205
	i32 4127667938, ; 691: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 692: System.AppContext => 0xf6318da0 => 6
	i32 4141580284, ; 693: Microsoft.AspNetCore.Authorization.Policy => 0xf6db7ffc => 179
	i32 4147896353, ; 694: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 695: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 350
	i32 4151237749, ; 696: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 697: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 698: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 699: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 700: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 701: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 279
	i32 4185676441, ; 702: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 703: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 704: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 705: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 256
	i32 4258378803, ; 706: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 278
	i32 4260525087, ; 707: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 708: Microsoft.Maui.Controls.dll => 0xfea12dee => 220
	i32 4274976490, ; 709: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 710: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 279
	i32 4294763496 ; 711: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 265
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [712 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 207, ; 3
	i32 275, ; 4
	i32 310, ; 5
	i32 48, ; 6
	i32 226, ; 7
	i32 80, ; 8
	i32 246, ; 9
	i32 145, ; 10
	i32 30, ; 11
	i32 354, ; 12
	i32 124, ; 13
	i32 224, ; 14
	i32 102, ; 15
	i32 293, ; 16
	i32 107, ; 17
	i32 293, ; 18
	i32 139, ; 19
	i32 314, ; 20
	i32 77, ; 21
	i32 124, ; 22
	i32 13, ; 23
	i32 249, ; 24
	i32 132, ; 25
	i32 198, ; 26
	i32 295, ; 27
	i32 151, ; 28
	i32 351, ; 29
	i32 352, ; 30
	i32 18, ; 31
	i32 243, ; 32
	i32 26, ; 33
	i32 269, ; 34
	i32 1, ; 35
	i32 59, ; 36
	i32 42, ; 37
	i32 91, ; 38
	i32 252, ; 39
	i32 147, ; 40
	i32 271, ; 41
	i32 268, ; 42
	i32 323, ; 43
	i32 54, ; 44
	i32 69, ; 45
	i32 176, ; 46
	i32 351, ; 47
	i32 234, ; 48
	i32 83, ; 49
	i32 336, ; 50
	i32 270, ; 51
	i32 190, ; 52
	i32 335, ; 53
	i32 131, ; 54
	i32 55, ; 55
	i32 149, ; 56
	i32 74, ; 57
	i32 145, ; 58
	i32 191, ; 59
	i32 62, ; 60
	i32 146, ; 61
	i32 355, ; 62
	i32 165, ; 63
	i32 347, ; 64
	i32 253, ; 65
	i32 12, ; 66
	i32 266, ; 67
	i32 125, ; 68
	i32 152, ; 69
	i32 113, ; 70
	i32 166, ; 71
	i32 164, ; 72
	i32 268, ; 73
	i32 281, ; 74
	i32 183, ; 75
	i32 84, ; 76
	i32 334, ; 77
	i32 328, ; 78
	i32 217, ; 79
	i32 150, ; 80
	i32 314, ; 81
	i32 60, ; 82
	i32 212, ; 83
	i32 51, ; 84
	i32 103, ; 85
	i32 114, ; 86
	i32 40, ; 87
	i32 307, ; 88
	i32 304, ; 89
	i32 120, ; 90
	i32 342, ; 91
	i32 173, ; 92
	i32 52, ; 93
	i32 44, ; 94
	i32 228, ; 95
	i32 119, ; 96
	i32 258, ; 97
	i32 340, ; 98
	i32 264, ; 99
	i32 81, ; 100
	i32 136, ; 101
	i32 300, ; 102
	i32 241, ; 103
	i32 8, ; 104
	i32 73, ; 105
	i32 322, ; 106
	i32 155, ; 107
	i32 316, ; 108
	i32 154, ; 109
	i32 92, ; 110
	i32 311, ; 111
	i32 45, ; 112
	i32 337, ; 113
	i32 325, ; 114
	i32 0, ; 115
	i32 315, ; 116
	i32 109, ; 117
	i32 179, ; 118
	i32 129, ; 119
	i32 25, ; 120
	i32 231, ; 121
	i32 72, ; 122
	i32 55, ; 123
	i32 229, ; 124
	i32 46, ; 125
	i32 346, ; 126
	i32 306, ; 127
	i32 216, ; 128
	i32 259, ; 129
	i32 22, ; 130
	i32 273, ; 131
	i32 86, ; 132
	i32 43, ; 133
	i32 160, ; 134
	i32 71, ; 135
	i32 320, ; 136
	i32 286, ; 137
	i32 318, ; 138
	i32 3, ; 139
	i32 42, ; 140
	i32 63, ; 141
	i32 16, ; 142
	i32 53, ; 143
	i32 349, ; 144
	i32 310, ; 145
	i32 105, ; 146
	i32 226, ; 147
	i32 315, ; 148
	i32 308, ; 149
	i32 270, ; 150
	i32 34, ; 151
	i32 158, ; 152
	i32 85, ; 153
	i32 32, ; 154
	i32 12, ; 155
	i32 51, ; 156
	i32 210, ; 157
	i32 56, ; 158
	i32 290, ; 159
	i32 36, ; 160
	i32 206, ; 161
	i32 324, ; 162
	i32 309, ; 163
	i32 239, ; 164
	i32 35, ; 165
	i32 58, ; 166
	i32 277, ; 167
	i32 306, ; 168
	i32 175, ; 169
	i32 17, ; 170
	i32 312, ; 171
	i32 229, ; 172
	i32 197, ; 173
	i32 164, ; 174
	i32 199, ; 175
	i32 204, ; 176
	i32 211, ; 177
	i32 176, ; 178
	i32 337, ; 179
	i32 276, ; 180
	i32 214, ; 181
	i32 303, ; 182
	i32 343, ; 183
	i32 153, ; 184
	i32 208, ; 185
	i32 299, ; 186
	i32 284, ; 187
	i32 341, ; 188
	i32 241, ; 189
	i32 29, ; 190
	i32 52, ; 191
	i32 225, ; 192
	i32 339, ; 193
	i32 196, ; 194
	i32 183, ; 195
	i32 304, ; 196
	i32 5, ; 197
	i32 323, ; 198
	i32 294, ; 199
	i32 298, ; 200
	i32 191, ; 201
	i32 250, ; 202
	i32 316, ; 203
	i32 238, ; 204
	i32 261, ; 205
	i32 85, ; 206
	i32 303, ; 207
	i32 61, ; 208
	i32 112, ; 209
	i32 57, ; 210
	i32 353, ; 211
	i32 290, ; 212
	i32 99, ; 213
	i32 19, ; 214
	i32 254, ; 215
	i32 111, ; 216
	i32 101, ; 217
	i32 180, ; 218
	i32 102, ; 219
	i32 321, ; 220
	i32 104, ; 221
	i32 308, ; 222
	i32 71, ; 223
	i32 38, ; 224
	i32 32, ; 225
	i32 103, ; 226
	i32 73, ; 227
	i32 327, ; 228
	i32 9, ; 229
	i32 123, ; 230
	i32 46, ; 231
	i32 240, ; 232
	i32 217, ; 233
	i32 9, ; 234
	i32 43, ; 235
	i32 4, ; 236
	i32 291, ; 237
	i32 331, ; 238
	i32 326, ; 239
	i32 210, ; 240
	i32 31, ; 241
	i32 138, ; 242
	i32 92, ; 243
	i32 93, ; 244
	i32 346, ; 245
	i32 218, ; 246
	i32 49, ; 247
	i32 141, ; 248
	i32 112, ; 249
	i32 140, ; 250
	i32 260, ; 251
	i32 115, ; 252
	i32 309, ; 253
	i32 157, ; 254
	i32 76, ; 255
	i32 79, ; 256
	i32 280, ; 257
	i32 37, ; 258
	i32 302, ; 259
	i32 174, ; 260
	i32 264, ; 261
	i32 257, ; 262
	i32 64, ; 263
	i32 138, ; 264
	i32 15, ; 265
	i32 116, ; 266
	i32 296, ; 267
	i32 305, ; 268
	i32 252, ; 269
	i32 48, ; 270
	i32 70, ; 271
	i32 80, ; 272
	i32 126, ; 273
	i32 94, ; 274
	i32 121, ; 275
	i32 313, ; 276
	i32 26, ; 277
	i32 273, ; 278
	i32 97, ; 279
	i32 28, ; 280
	i32 248, ; 281
	i32 344, ; 282
	i32 322, ; 283
	i32 149, ; 284
	i32 227, ; 285
	i32 169, ; 286
	i32 4, ; 287
	i32 98, ; 288
	i32 33, ; 289
	i32 93, ; 290
	i32 295, ; 291
	i32 212, ; 292
	i32 21, ; 293
	i32 41, ; 294
	i32 194, ; 295
	i32 170, ; 296
	i32 338, ; 297
	i32 266, ; 298
	i32 330, ; 299
	i32 280, ; 300
	i32 312, ; 301
	i32 305, ; 302
	i32 285, ; 303
	i32 2, ; 304
	i32 187, ; 305
	i32 134, ; 306
	i32 111, ; 307
	i32 213, ; 308
	i32 350, ; 309
	i32 231, ; 310
	i32 347, ; 311
	i32 58, ; 312
	i32 95, ; 313
	i32 329, ; 314
	i32 39, ; 315
	i32 242, ; 316
	i32 25, ; 317
	i32 94, ; 318
	i32 199, ; 319
	i32 89, ; 320
	i32 99, ; 321
	i32 10, ; 322
	i32 185, ; 323
	i32 87, ; 324
	i32 100, ; 325
	i32 292, ; 326
	i32 200, ; 327
	i32 313, ; 328
	i32 233, ; 329
	i32 326, ; 330
	i32 7, ; 331
	i32 277, ; 332
	i32 321, ; 333
	i32 230, ; 334
	i32 88, ; 335
	i32 202, ; 336
	i32 193, ; 337
	i32 272, ; 338
	i32 154, ; 339
	i32 325, ; 340
	i32 33, ; 341
	i32 209, ; 342
	i32 185, ; 343
	i32 116, ; 344
	i32 82, ; 345
	i32 193, ; 346
	i32 20, ; 347
	i32 11, ; 348
	i32 218, ; 349
	i32 162, ; 350
	i32 3, ; 351
	i32 222, ; 352
	i32 333, ; 353
	i32 216, ; 354
	i32 189, ; 355
	i32 213, ; 356
	i32 84, ; 357
	i32 203, ; 358
	i32 207, ; 359
	i32 317, ; 360
	i32 64, ; 361
	i32 215, ; 362
	i32 335, ; 363
	i32 299, ; 364
	i32 143, ; 365
	i32 184, ; 366
	i32 281, ; 367
	i32 157, ; 368
	i32 41, ; 369
	i32 117, ; 370
	i32 201, ; 371
	i32 232, ; 372
	i32 329, ; 373
	i32 288, ; 374
	i32 188, ; 375
	i32 131, ; 376
	i32 75, ; 377
	i32 66, ; 378
	i32 339, ; 379
	i32 172, ; 380
	i32 236, ; 381
	i32 143, ; 382
	i32 188, ; 383
	i32 106, ; 384
	i32 151, ; 385
	i32 70, ; 386
	i32 156, ; 387
	i32 200, ; 388
	i32 121, ; 389
	i32 127, ; 390
	i32 334, ; 391
	i32 152, ; 392
	i32 263, ; 393
	i32 197, ; 394
	i32 141, ; 395
	i32 250, ; 396
	i32 331, ; 397
	i32 20, ; 398
	i32 14, ; 399
	i32 135, ; 400
	i32 177, ; 401
	i32 75, ; 402
	i32 59, ; 403
	i32 253, ; 404
	i32 167, ; 405
	i32 168, ; 406
	i32 220, ; 407
	i32 15, ; 408
	i32 74, ; 409
	i32 6, ; 410
	i32 23, ; 411
	i32 275, ; 412
	i32 230, ; 413
	i32 178, ; 414
	i32 91, ; 415
	i32 332, ; 416
	i32 1, ; 417
	i32 136, ; 418
	i32 276, ; 419
	i32 298, ; 420
	i32 134, ; 421
	i32 69, ; 422
	i32 146, ; 423
	i32 208, ; 424
	i32 192, ; 425
	i32 341, ; 426
	i32 182, ; 427
	i32 317, ; 428
	i32 267, ; 429
	i32 214, ; 430
	i32 88, ; 431
	i32 96, ; 432
	i32 257, ; 433
	i32 262, ; 434
	i32 336, ; 435
	i32 31, ; 436
	i32 45, ; 437
	i32 271, ; 438
	i32 186, ; 439
	i32 232, ; 440
	i32 109, ; 441
	i32 158, ; 442
	i32 35, ; 443
	i32 22, ; 444
	i32 114, ; 445
	i32 57, ; 446
	i32 296, ; 447
	i32 144, ; 448
	i32 118, ; 449
	i32 120, ; 450
	i32 110, ; 451
	i32 234, ; 452
	i32 139, ; 453
	i32 178, ; 454
	i32 240, ; 455
	i32 54, ; 456
	i32 105, ; 457
	i32 342, ; 458
	i32 221, ; 459
	i32 222, ; 460
	i32 133, ; 461
	i32 311, ; 462
	i32 301, ; 463
	i32 289, ; 464
	i32 348, ; 465
	i32 267, ; 466
	i32 224, ; 467
	i32 159, ; 468
	i32 327, ; 469
	i32 254, ; 470
	i32 163, ; 471
	i32 132, ; 472
	i32 289, ; 473
	i32 161, ; 474
	i32 340, ; 475
	i32 181, ; 476
	i32 278, ; 477
	i32 140, ; 478
	i32 187, ; 479
	i32 301, ; 480
	i32 297, ; 481
	i32 169, ; 482
	i32 223, ; 483
	i32 174, ; 484
	i32 235, ; 485
	i32 307, ; 486
	i32 40, ; 487
	i32 265, ; 488
	i32 81, ; 489
	i32 56, ; 490
	i32 37, ; 491
	i32 97, ; 492
	i32 166, ; 493
	i32 172, ; 494
	i32 209, ; 495
	i32 302, ; 496
	i32 82, ; 497
	i32 237, ; 498
	i32 98, ; 499
	i32 30, ; 500
	i32 159, ; 501
	i32 18, ; 502
	i32 247, ; 503
	i32 127, ; 504
	i32 119, ; 505
	i32 182, ; 506
	i32 261, ; 507
	i32 292, ; 508
	i32 245, ; 509
	i32 184, ; 510
	i32 274, ; 511
	i32 247, ; 512
	i32 294, ; 513
	i32 0, ; 514
	i32 165, ; 515
	i32 269, ; 516
	i32 177, ; 517
	i32 186, ; 518
	i32 355, ; 519
	i32 245, ; 520
	i32 291, ; 521
	i32 282, ; 522
	i32 170, ; 523
	i32 16, ; 524
	i32 144, ; 525
	i32 333, ; 526
	i32 125, ; 527
	i32 118, ; 528
	i32 38, ; 529
	i32 115, ; 530
	i32 192, ; 531
	i32 47, ; 532
	i32 142, ; 533
	i32 117, ; 534
	i32 34, ; 535
	i32 175, ; 536
	i32 189, ; 537
	i32 95, ; 538
	i32 53, ; 539
	i32 283, ; 540
	i32 203, ; 541
	i32 129, ; 542
	i32 153, ; 543
	i32 24, ; 544
	i32 161, ; 545
	i32 260, ; 546
	i32 318, ; 547
	i32 148, ; 548
	i32 104, ; 549
	i32 190, ; 550
	i32 89, ; 551
	i32 248, ; 552
	i32 60, ; 553
	i32 142, ; 554
	i32 100, ; 555
	i32 5, ; 556
	i32 13, ; 557
	i32 319, ; 558
	i32 122, ; 559
	i32 135, ; 560
	i32 198, ; 561
	i32 28, ; 562
	i32 328, ; 563
	i32 72, ; 564
	i32 258, ; 565
	i32 24, ; 566
	i32 242, ; 567
	i32 287, ; 568
	i32 284, ; 569
	i32 345, ; 570
	i32 137, ; 571
	i32 235, ; 572
	i32 255, ; 573
	i32 168, ; 574
	i32 288, ; 575
	i32 324, ; 576
	i32 101, ; 577
	i32 123, ; 578
	i32 259, ; 579
	i32 244, ; 580
	i32 202, ; 581
	i32 195, ; 582
	i32 244, ; 583
	i32 205, ; 584
	i32 163, ; 585
	i32 167, ; 586
	i32 262, ; 587
	i32 39, ; 588
	i32 219, ; 589
	i32 332, ; 590
	i32 17, ; 591
	i32 171, ; 592
	i32 345, ; 593
	i32 344, ; 594
	i32 137, ; 595
	i32 150, ; 596
	i32 251, ; 597
	i32 155, ; 598
	i32 130, ; 599
	i32 19, ; 600
	i32 65, ; 601
	i32 147, ; 602
	i32 47, ; 603
	i32 352, ; 604
	i32 233, ; 605
	i32 79, ; 606
	i32 61, ; 607
	i32 181, ; 608
	i32 106, ; 609
	i32 286, ; 610
	i32 237, ; 611
	i32 49, ; 612
	i32 272, ; 613
	i32 349, ; 614
	i32 283, ; 615
	i32 14, ; 616
	i32 194, ; 617
	i32 201, ; 618
	i32 68, ; 619
	i32 171, ; 620
	i32 246, ; 621
	i32 243, ; 622
	i32 251, ; 623
	i32 354, ; 624
	i32 78, ; 625
	i32 195, ; 626
	i32 256, ; 627
	i32 108, ; 628
	i32 236, ; 629
	i32 282, ; 630
	i32 228, ; 631
	i32 67, ; 632
	i32 63, ; 633
	i32 27, ; 634
	i32 160, ; 635
	i32 320, ; 636
	i32 204, ; 637
	i32 215, ; 638
	i32 249, ; 639
	i32 180, ; 640
	i32 10, ; 641
	i32 219, ; 642
	i32 11, ; 643
	i32 173, ; 644
	i32 78, ; 645
	i32 126, ; 646
	i32 83, ; 647
	i32 206, ; 648
	i32 319, ; 649
	i32 66, ; 650
	i32 107, ; 651
	i32 65, ; 652
	i32 128, ; 653
	i32 122, ; 654
	i32 77, ; 655
	i32 297, ; 656
	i32 287, ; 657
	i32 353, ; 658
	i32 8, ; 659
	i32 255, ; 660
	i32 2, ; 661
	i32 196, ; 662
	i32 44, ; 663
	i32 300, ; 664
	i32 156, ; 665
	i32 128, ; 666
	i32 285, ; 667
	i32 23, ; 668
	i32 133, ; 669
	i32 239, ; 670
	i32 274, ; 671
	i32 348, ; 672
	i32 330, ; 673
	i32 29, ; 674
	i32 238, ; 675
	i32 227, ; 676
	i32 62, ; 677
	i32 225, ; 678
	i32 221, ; 679
	i32 90, ; 680
	i32 87, ; 681
	i32 148, ; 682
	i32 211, ; 683
	i32 223, ; 684
	i32 36, ; 685
	i32 86, ; 686
	i32 263, ; 687
	i32 343, ; 688
	i32 338, ; 689
	i32 205, ; 690
	i32 50, ; 691
	i32 6, ; 692
	i32 179, ; 693
	i32 90, ; 694
	i32 350, ; 695
	i32 21, ; 696
	i32 162, ; 697
	i32 96, ; 698
	i32 50, ; 699
	i32 113, ; 700
	i32 279, ; 701
	i32 130, ; 702
	i32 76, ; 703
	i32 27, ; 704
	i32 256, ; 705
	i32 278, ; 706
	i32 7, ; 707
	i32 220, ; 708
	i32 110, ; 709
	i32 279, ; 710
	i32 265 ; 711
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
