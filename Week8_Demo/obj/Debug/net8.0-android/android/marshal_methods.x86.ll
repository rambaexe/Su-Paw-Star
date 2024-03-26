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

@assembly_image_cache = dso_local local_unnamed_addr global [330 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [660 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 253
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 287
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 295
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 198
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 9: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 304
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 328
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 196
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 16: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 312
	i32 95598293, ; 17: Supabase.dll => 0x5b2b6d5 => 207
	i32 101534019, ; 18: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 271
	i32 117431740, ; 19: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 20: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 271
	i32 122350210, ; 21: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 22: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 291
	i32 136584136, ; 23: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 327
	i32 140062828, ; 24: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 320
	i32 142721839, ; 25: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 26: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 27: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 162612358, ; 28: MimeMapping => 0x9b14486 => 197
	i32 165246403, ; 29: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 227
	i32 176265551, ; 30: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 31: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 273
	i32 184328833, ; 32: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 33: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 34: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 225
	i32 220171995, ; 35: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 36: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 247
	i32 230752869, ; 37: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 38: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 39: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 40: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 41: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 230
	i32 276479776, ; 42: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 43: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 249
	i32 280482487, ; 44: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 246
	i32 291076382, ; 45: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 46: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 47: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 325
	i32 318968648, ; 48: Xamarin.AndroidX.Activity.dll => 0x13031348 => 216
	i32 321597661, ; 49: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 50: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 303
	i32 342366114, ; 51: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 248
	i32 347068432, ; 52: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 204
	i32 360082299, ; 53: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 54: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 55: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 56: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 57: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 58: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 59: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 60: _Microsoft.Android.Resource.Designer => 0x17969339 => 329
	i32 403441872, ; 61: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 62: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 323
	i32 441335492, ; 63: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 231
	i32 442565967, ; 64: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 65: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 244
	i32 451504562, ; 66: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 67: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 70: System.dll => 0x1bff388e => 164
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 246
	i32 485463106, ; 72: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 187
	i32 486930444, ; 73: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 259
	i32 489220957, ; 74: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 301
	i32 498788369, ; 75: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 76: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 186
	i32 526420162, ; 77: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 78: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 291
	i32 530272170, ; 79: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 80: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 322
	i32 539058512, ; 81: Microsoft.Extensions.Logging => 0x20216150 => 182
	i32 540030774, ; 82: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 83: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 84: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 85: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 86: Jsr305Binding => 0x213954e7 => 284
	i32 569601784, ; 87: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 282
	i32 577335427, ; 88: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 601371474, ; 89: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 90: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 610194910, ; 91: System.Reactive.dll => 0x245ed5de => 210
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 236
	i32 627931235, ; 94: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 314
	i32 639843206, ; 95: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 242
	i32 643868501, ; 96: System.Net => 0x2660a755 => 81
	i32 662205335, ; 97: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 98: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 278
	i32 666292255, ; 99: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 223
	i32 672442732, ; 100: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 101: System.Net.Security => 0x28bdabca => 73
	i32 685806876, ; 102: MauiMicroMvvm => 0x28e0951c => 173
	i32 690569205, ; 103: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 104: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 293
	i32 693804605, ; 105: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 106: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 107: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 288
	i32 700358131, ; 108: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 109: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 292
	i32 722857257, ; 110: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 111: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 748832960, ; 112: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 202
	i32 752232764, ; 113: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 114: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 213
	i32 759454413, ; 115: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 116: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 763346851, ; 117: Websocket.Client => 0x2d7fbfa3 => 211
	i32 772621961, ; 118: Supabase.Core.dll => 0x2e0d4689 => 206
	i32 775507847, ; 119: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 120: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 320
	i32 789151979, ; 121: Microsoft.Extensions.Options => 0x2f0980eb => 185
	i32 790371945, ; 122: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 237
	i32 804715423, ; 123: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 124: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 251
	i32 823281589, ; 125: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 126: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 127: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 128: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 129: Xamarin.AndroidX.Print => 0x3246f6cd => 264
	i32 869139383, ; 130: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 305
	i32 873119928, ; 131: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 132: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 133: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 134: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 319
	i32 904024072, ; 135: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 136: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 137: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 316
	i32 920281169, ; 138: Supabase.Functions => 0x36da6051 => 175
	i32 928116545, ; 139: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 287
	i32 952186615, ; 140: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 141: Newtonsoft.Json => 0x38f24a24 => 198
	i32 956575887, ; 142: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 292
	i32 961460050, ; 143: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 309
	i32 966729478, ; 144: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 285
	i32 967690846, ; 145: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 248
	i32 975236339, ; 146: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 147: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 148: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 149: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 150: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 318
	i32 992768348, ; 151: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 152: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 153: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 154: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 268
	i32 1019214401, ; 155: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 156: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 181
	i32 1031528504, ; 157: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 286
	i32 1035644815, ; 158: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 221
	i32 1036536393, ; 159: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 160: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 299
	i32 1044663988, ; 161: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 162: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 255
	i32 1067306892, ; 163: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 164: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 165: Xamarin.Kotlin.StdLib => 0x409e66d8 => 289
	i32 1089187994, ; 166: Websocket.Client.dll => 0x40ebb09a => 211
	i32 1098259244, ; 167: System => 0x41761b2c => 164
	i32 1108272742, ; 168: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 321
	i32 1117529484, ; 169: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 315
	i32 1118262833, ; 170: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 311
	i32 1121599056, ; 171: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 254
	i32 1127624469, ; 172: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 184
	i32 1149092582, ; 173: Xamarin.AndroidX.Window => 0x447dc2e6 => 281
	i32 1168523401, ; 174: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 317
	i32 1170634674, ; 175: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 176: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 277
	i32 1178241025, ; 177: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 262
	i32 1204270330, ; 178: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 223
	i32 1208641965, ; 179: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 180: CommunityToolkit.Mvvm => 0x4868cc7b => 174
	i32 1216849306, ; 181: Supabase.Realtime.dll => 0x4887a59a => 200
	i32 1219128291, ; 182: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1219540809, ; 183: Supabase.Functions.dll => 0x48b0b749 => 175
	i32 1243150071, ; 184: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 282
	i32 1253011324, ; 185: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 186: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 297
	i32 1264511973, ; 187: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 272
	i32 1267360935, ; 188: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 276
	i32 1273260888, ; 189: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 228
	i32 1275534314, ; 190: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 293
	i32 1278448581, ; 191: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 220
	i32 1292207520, ; 192: SQLitePCLRaw.core.dll => 0x4d0585a0 => 203
	i32 1293217323, ; 193: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 239
	i32 1308624726, ; 194: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 306
	i32 1309188875, ; 195: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 196: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 281
	i32 1324164729, ; 197: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 198: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 199: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 326
	i32 1336984896, ; 200: Supabase.Core => 0x4fb0c540 => 206
	i32 1364015309, ; 201: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 202: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 327
	i32 1376866003, ; 203: Xamarin.AndroidX.SavedState => 0x52114ed3 => 268
	i32 1379779777, ; 204: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 205: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 206: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 232
	i32 1408764838, ; 207: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 208: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 209: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 210: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 295
	i32 1434145427, ; 211: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 212: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 285
	i32 1439761251, ; 213: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 214: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 215: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 216: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 217: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 218: System.IdentityModel.Tokens.Jwt => 0x57137723 => 209
	i32 1461004990, ; 219: es\Microsoft.Maui.Controls.resources => 0x57152abe => 301
	i32 1461234159, ; 220: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 221: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 222: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 223: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 222
	i32 1470490898, ; 224: Microsoft.Extensions.Primitives => 0x57a5e912 => 186
	i32 1479771757, ; 225: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 226: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 227: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 228: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 269
	i32 1498168481, ; 229: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 188
	i32 1516168485, ; 230: Supabase.Gotrue => 0x5a5ee525 => 177
	i32 1526286932, ; 231: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 325
	i32 1536373174, ; 232: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 233: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 234: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 235: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 236: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 237: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 238: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 239: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 240: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 238
	i32 1592978981, ; 241: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 242: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 286
	i32 1601112923, ; 243: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 244: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 245: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 246: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 258
	i32 1622358360, ; 247: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 248: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 280
	i32 1635184631, ; 249: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 242
	i32 1636350590, ; 250: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 235
	i32 1639515021, ; 251: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 252: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 253: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 254: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 255: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 274
	i32 1658251792, ; 256: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 283
	i32 1670060433, ; 257: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 230
	i32 1675553242, ; 258: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 259: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 260: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 261: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 262: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 263: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 264: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 290
	i32 1701541528, ; 265: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1711441057, ; 266: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 204
	i32 1720223769, ; 267: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 251
	i32 1726116996, ; 268: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 269: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 270: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 226
	i32 1743415430, ; 271: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 296
	i32 1744735666, ; 272: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 273: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 274: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 275: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 276: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 277: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 278: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 273
	i32 1770582343, ; 279: Microsoft.Extensions.Logging.dll => 0x6988f147 => 182
	i32 1776026572, ; 280: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 281: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 282: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 283: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 312
	i32 1788241197, ; 284: Xamarin.AndroidX.Fragment => 0x6a96652d => 244
	i32 1793755602, ; 285: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 304
	i32 1808609942, ; 286: Xamarin.AndroidX.Loader => 0x6bcd3296 => 258
	i32 1813058853, ; 287: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 289
	i32 1813201214, ; 288: Xamarin.Google.Android.Material => 0x6c13413e => 283
	i32 1818569960, ; 289: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 263
	i32 1818787751, ; 290: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 291: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 292: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 293: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 183
	i32 1847515442, ; 294: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 213
	i32 1853025655, ; 295: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 321
	i32 1858542181, ; 296: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 297: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 298: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 303
	i32 1879696579, ; 299: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 300: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 224
	i32 1888955245, ; 301: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 302: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 303: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 297
	i32 1898237753, ; 304: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 305: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 306: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 307: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 308: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 308
	i32 1956758971, ; 309: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 310: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 270
	i32 1968388702, ; 311: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 178
	i32 1983156543, ; 312: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 290
	i32 1985761444, ; 313: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 215
	i32 1986222447, ; 314: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 190
	i32 2003115576, ; 315: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 300
	i32 2011961780, ; 316: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2018526534, ; 317: Supabase.Gotrue.dll => 0x78504546 => 177
	i32 2019465201, ; 318: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 255
	i32 2031763787, ; 319: Xamarin.Android.Glide => 0x791a414b => 212
	i32 2045470958, ; 320: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 321: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 250
	i32 2060060697, ; 322: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 323: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 299
	i32 2070888862, ; 324: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 325: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 326: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2103459038, ; 327: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 205
	i32 2127167465, ; 328: System.Console => 0x7ec9ffe9 => 20
	i32 2128198166, ; 329: Supabase.Realtime => 0x7ed9ba16 => 200
	i32 2138252982, ; 330: Supabase => 0x7f7326b6 => 207
	i32 2142473426, ; 331: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 332: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 333: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 334: Microsoft.Maui => 0x80bd55ad => 194
	i32 2169148018, ; 335: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 307
	i32 2181898931, ; 336: Microsoft.Extensions.Options.dll => 0x820d22b3 => 185
	i32 2192057212, ; 337: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 183
	i32 2193016926, ; 338: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 339: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 294
	i32 2201231467, ; 340: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 341: it\Microsoft.Maui.Controls.resources => 0x839595db => 309
	i32 2217644978, ; 342: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 277
	i32 2222056684, ; 343: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 344: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 259
	i32 2252106437, ; 345: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 346: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 347: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 348: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 179
	i32 2267999099, ; 349: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 214
	i32 2279755925, ; 350: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 266
	i32 2293034957, ; 351: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 352: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 353: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 354: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 313
	i32 2305521784, ; 355: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 356: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 218
	i32 2320631194, ; 357: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 358: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 359: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 360: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 361: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 307
	i32 2368005991, ; 362: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 363: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 189
	i32 2371007202, ; 364: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 178
	i32 2378619854, ; 365: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 366: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 367: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 308
	i32 2401565422, ; 368: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 369: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 241
	i32 2413709012, ; 370: Week8_Demo => 0x8fde46d4 => 0
	i32 2421380589, ; 371: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 372: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 228
	i32 2427813419, ; 373: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 305
	i32 2435356389, ; 374: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 375: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 376: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 377: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 378: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2459069535, ; 379: Week8_Demo.dll => 0x92926c5f => 0
	i32 2465273461, ; 380: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 202
	i32 2465532216, ; 381: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 231
	i32 2467869862, ; 382: MauiMicroMvvm.dll => 0x9318b4a6 => 173
	i32 2471841756, ; 383: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 384: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 385: Microsoft.Maui.Controls => 0x93dba8a1 => 192
	i32 2483903535, ; 386: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 387: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 388: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 389: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 390: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 311
	i32 2505896520, ; 391: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 253
	i32 2522472828, ; 392: Xamarin.Android.Glide.dll => 0x9659e17c => 212
	i32 2538310050, ; 393: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 394: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 306
	i32 2562349572, ; 395: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 396: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 397: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 310
	i32 2581783588, ; 398: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 254
	i32 2581819634, ; 399: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 276
	i32 2585220780, ; 400: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 401: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 402: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 403: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 315
	i32 2605712449, ; 404: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 294
	i32 2615233544, ; 405: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 245
	i32 2616218305, ; 406: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 184
	i32 2617129537, ; 407: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 408: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 409: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 235
	i32 2624644809, ; 410: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 240
	i32 2626831493, ; 411: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 310
	i32 2627185994, ; 412: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 413: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 414: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 249
	i32 2640290731, ; 415: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 189
	i32 2663391936, ; 416: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 214
	i32 2663698177, ; 417: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 418: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 419: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 420: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 421: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 422: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 423: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 274
	i32 2715334215, ; 424: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 425: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 426: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 427: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 428: Xamarin.AndroidX.Activity => 0xa2e0939b => 216
	i32 2735172069, ; 429: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 430: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 222
	i32 2740698338, ; 431: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 296
	i32 2740948882, ; 432: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 433: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 434: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 316
	i32 2758225723, ; 435: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 193
	i32 2764765095, ; 436: Microsoft.Maui.dll => 0xa4caf7a7 => 194
	i32 2765824710, ; 437: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 438: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 288
	i32 2778768386, ; 439: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 279
	i32 2779977773, ; 440: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 267
	i32 2785988530, ; 441: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 322
	i32 2788224221, ; 442: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 245
	i32 2801831435, ; 443: Microsoft.Maui.Graphics => 0xa7008e0b => 196
	i32 2803228030, ; 444: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 445: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 232
	i32 2819470561, ; 446: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 447: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 448: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 267
	i32 2824502124, ; 449: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2838993487, ; 450: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 256
	i32 2849599387, ; 451: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 452: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 279
	i32 2855708567, ; 453: Xamarin.AndroidX.Transition => 0xaa36a797 => 275
	i32 2861098320, ; 454: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 455: Microsoft.Maui.Essentials => 0xaa8a4878 => 195
	i32 2870099610, ; 456: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 217
	i32 2875164099, ; 457: Jsr305Binding.dll => 0xab5f85c3 => 284
	i32 2875220617, ; 458: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 459: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 243
	i32 2887636118, ; 460: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 461: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 462: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 463: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 464: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 465: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 466: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 280
	i32 2919462931, ; 467: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 468: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 219
	i32 2936416060, ; 469: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 470: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 471: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 472: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 473: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 474: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 475: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 239
	i32 2987532451, ; 476: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 270
	i32 2996846495, ; 477: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 252
	i32 3016983068, ; 478: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 272
	i32 3023353419, ; 479: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 480: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 247
	i32 3038032645, ; 481: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 329
	i32 3053864966, ; 482: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 302
	i32 3056245963, ; 483: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 269
	i32 3057625584, ; 484: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 260
	i32 3059408633, ; 485: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 486: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 487: System.Threading.Tasks => 0xb755818f => 144
	i32 3084678329, ; 488: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 190
	i32 3090735792, ; 489: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099081453, ; 490: MimeMapping.dll => 0xb8b83aed => 197
	i32 3099732863, ; 491: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 492: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 493: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 494: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 495: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 496: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3138360719, ; 497: Supabase.Postgrest.dll => 0xbb0f958f => 199
	i32 3147165239, ; 498: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 499: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 500: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 501: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 502: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 261
	i32 3192346100, ; 503: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 504: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 505: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 506: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 507: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 238
	i32 3220365878, ; 508: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 509: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 510: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 511: Xamarin.AndroidX.CardView => 0xc235e84d => 226
	i32 3265493905, ; 512: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 513: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 514: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 515: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 516: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3286872994, ; 517: SQLite-net.dll => 0xc3e9b3a2 => 201
	i32 3290767353, ; 518: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 519: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 520: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 521: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 302
	i32 3312457198, ; 522: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 188
	i32 3316684772, ; 523: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 524: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 236
	i32 3317144872, ; 525: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 526: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 224
	i32 3345895724, ; 527: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 265
	i32 3346324047, ; 528: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 262
	i32 3357674450, ; 529: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 319
	i32 3358260929, ; 530: System.Text.Json => 0xc82afec1 => 137
	i32 3360279109, ; 531: SQLitePCLRaw.core => 0xc849ca45 => 203
	i32 3362336904, ; 532: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 217
	i32 3362522851, ; 533: Xamarin.AndroidX.Core => 0xc86c06e3 => 233
	i32 3366347497, ; 534: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 535: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 266
	i32 3381016424, ; 536: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 298
	i32 3395150330, ; 537: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 538: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 539: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 237
	i32 3428513518, ; 540: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 180
	i32 3429136800, ; 541: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 542: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 543: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 240
	i32 3445260447, ; 544: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 545: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 191
	i32 3458724246, ; 546: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 317
	i32 3471940407, ; 547: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 548: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 549: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 318
	i32 3485117614, ; 550: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 551: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 552: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 229
	i32 3509114376, ; 553: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 554: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 555: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 556: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 557: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 558: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 559: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 326
	i32 3592228221, ; 560: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 328
	i32 3597029428, ; 561: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 215
	i32 3598340787, ; 562: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3607666123, ; 563: Supabase.Postgrest => 0xd7089dcb => 199
	i32 3608519521, ; 564: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 565: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 566: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 264
	i32 3633644679, ; 567: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 219
	i32 3638274909, ; 568: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 569: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 250
	i32 3643446276, ; 570: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 323
	i32 3643854240, ; 571: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 261
	i32 3645089577, ; 572: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 573: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 179
	i32 3660523487, ; 574: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 575: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 576: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 225
	i32 3684561358, ; 577: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 229
	i32 3700591436, ; 578: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 187
	i32 3700866549, ; 579: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 580: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 234
	i32 3716563718, ; 581: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 582: Xamarin.AndroidX.Annotation => 0xdda814c6 => 218
	i32 3724971120, ; 583: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 260
	i32 3731644420, ; 584: System.Reactive => 0xde6c6004 => 210
	i32 3732100267, ; 585: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 586: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 587: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 588: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 589: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 298
	i32 3754567612, ; 590: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 205
	i32 3786282454, ; 591: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 227
	i32 3792276235, ; 592: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 593: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 191
	i32 3802395368, ; 594: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 595: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 596: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 597: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 598: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 181
	i32 3844307129, ; 599: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 600: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 601: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 602: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 603: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3876362041, ; 604: SQLite-net => 0xe70c9739 => 201
	i32 3885497537, ; 605: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 606: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 275
	i32 3888767677, ; 607: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 265
	i32 3896106733, ; 608: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 609: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 233
	i32 3901907137, ; 610: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3906640997, ; 611: Supabase.Storage.dll => 0xe8da9c65 => 208
	i32 3920221145, ; 612: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 314
	i32 3920810846, ; 613: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 614: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 278
	i32 3928044579, ; 615: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 616: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 617: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 263
	i32 3945713374, ; 618: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 619: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 620: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 221
	i32 3959773229, ; 621: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 252
	i32 3980364293, ; 622: Supabase.Storage => 0xed3f8a05 => 208
	i32 4003436829, ; 623: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 624: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 220
	i32 4025784931, ; 625: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 626: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 193
	i32 4054681211, ; 627: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 628: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 629: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 630: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 300
	i32 4094352644, ; 631: Microsoft.Maui.Essentials.dll => 0xf40add04 => 195
	i32 4099507663, ; 632: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 633: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 634: Xamarin.AndroidX.Emoji2 => 0xf479582c => 241
	i32 4103439459, ; 635: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 324
	i32 4126470640, ; 636: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 180
	i32 4127667938, ; 637: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 638: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 639: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 640: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 324
	i32 4151237749, ; 641: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 642: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 643: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 644: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 645: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 646: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 257
	i32 4185676441, ; 647: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 648: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 649: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 650: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 313
	i32 4256097574, ; 651: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 234
	i32 4258378803, ; 652: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 256
	i32 4260525087, ; 653: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 654: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 209
	i32 4271975918, ; 655: Microsoft.Maui.Controls.dll => 0xfea12dee => 192
	i32 4274623895, ; 656: CommunityToolkit.Mvvm.dll => 0xfec99597 => 174
	i32 4274976490, ; 657: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 658: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 257
	i32 4294763496 ; 659: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 243
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [660 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 253, ; 3
	i32 287, ; 4
	i32 48, ; 5
	i32 295, ; 6
	i32 198, ; 7
	i32 80, ; 8
	i32 304, ; 9
	i32 145, ; 10
	i32 30, ; 11
	i32 328, ; 12
	i32 124, ; 13
	i32 196, ; 14
	i32 102, ; 15
	i32 312, ; 16
	i32 207, ; 17
	i32 271, ; 18
	i32 107, ; 19
	i32 271, ; 20
	i32 139, ; 21
	i32 291, ; 22
	i32 327, ; 23
	i32 320, ; 24
	i32 77, ; 25
	i32 124, ; 26
	i32 13, ; 27
	i32 197, ; 28
	i32 227, ; 29
	i32 132, ; 30
	i32 273, ; 31
	i32 151, ; 32
	i32 18, ; 33
	i32 225, ; 34
	i32 26, ; 35
	i32 247, ; 36
	i32 1, ; 37
	i32 59, ; 38
	i32 42, ; 39
	i32 91, ; 40
	i32 230, ; 41
	i32 147, ; 42
	i32 249, ; 43
	i32 246, ; 44
	i32 54, ; 45
	i32 69, ; 46
	i32 325, ; 47
	i32 216, ; 48
	i32 83, ; 49
	i32 303, ; 50
	i32 248, ; 51
	i32 204, ; 52
	i32 131, ; 53
	i32 55, ; 54
	i32 149, ; 55
	i32 74, ; 56
	i32 145, ; 57
	i32 62, ; 58
	i32 146, ; 59
	i32 329, ; 60
	i32 165, ; 61
	i32 323, ; 62
	i32 231, ; 63
	i32 12, ; 64
	i32 244, ; 65
	i32 125, ; 66
	i32 152, ; 67
	i32 113, ; 68
	i32 166, ; 69
	i32 164, ; 70
	i32 246, ; 71
	i32 187, ; 72
	i32 259, ; 73
	i32 301, ; 74
	i32 84, ; 75
	i32 186, ; 76
	i32 150, ; 77
	i32 291, ; 78
	i32 60, ; 79
	i32 322, ; 80
	i32 182, ; 81
	i32 51, ; 82
	i32 103, ; 83
	i32 114, ; 84
	i32 40, ; 85
	i32 284, ; 86
	i32 282, ; 87
	i32 120, ; 88
	i32 52, ; 89
	i32 44, ; 90
	i32 210, ; 91
	i32 119, ; 92
	i32 236, ; 93
	i32 314, ; 94
	i32 242, ; 95
	i32 81, ; 96
	i32 136, ; 97
	i32 278, ; 98
	i32 223, ; 99
	i32 8, ; 100
	i32 73, ; 101
	i32 173, ; 102
	i32 155, ; 103
	i32 293, ; 104
	i32 154, ; 105
	i32 92, ; 106
	i32 288, ; 107
	i32 45, ; 108
	i32 292, ; 109
	i32 109, ; 110
	i32 129, ; 111
	i32 202, ; 112
	i32 25, ; 113
	i32 213, ; 114
	i32 72, ; 115
	i32 55, ; 116
	i32 211, ; 117
	i32 206, ; 118
	i32 46, ; 119
	i32 320, ; 120
	i32 185, ; 121
	i32 237, ; 122
	i32 22, ; 123
	i32 251, ; 124
	i32 86, ; 125
	i32 43, ; 126
	i32 160, ; 127
	i32 71, ; 128
	i32 264, ; 129
	i32 305, ; 130
	i32 3, ; 131
	i32 42, ; 132
	i32 63, ; 133
	i32 319, ; 134
	i32 16, ; 135
	i32 53, ; 136
	i32 316, ; 137
	i32 175, ; 138
	i32 287, ; 139
	i32 105, ; 140
	i32 198, ; 141
	i32 292, ; 142
	i32 309, ; 143
	i32 285, ; 144
	i32 248, ; 145
	i32 34, ; 146
	i32 158, ; 147
	i32 85, ; 148
	i32 32, ; 149
	i32 318, ; 150
	i32 12, ; 151
	i32 51, ; 152
	i32 56, ; 153
	i32 268, ; 154
	i32 36, ; 155
	i32 181, ; 156
	i32 286, ; 157
	i32 221, ; 158
	i32 35, ; 159
	i32 299, ; 160
	i32 58, ; 161
	i32 255, ; 162
	i32 176, ; 163
	i32 17, ; 164
	i32 289, ; 165
	i32 211, ; 166
	i32 164, ; 167
	i32 321, ; 168
	i32 315, ; 169
	i32 311, ; 170
	i32 254, ; 171
	i32 184, ; 172
	i32 281, ; 173
	i32 317, ; 174
	i32 153, ; 175
	i32 277, ; 176
	i32 262, ; 177
	i32 223, ; 178
	i32 29, ; 179
	i32 174, ; 180
	i32 200, ; 181
	i32 52, ; 182
	i32 175, ; 183
	i32 282, ; 184
	i32 5, ; 185
	i32 297, ; 186
	i32 272, ; 187
	i32 276, ; 188
	i32 228, ; 189
	i32 293, ; 190
	i32 220, ; 191
	i32 203, ; 192
	i32 239, ; 193
	i32 306, ; 194
	i32 85, ; 195
	i32 281, ; 196
	i32 61, ; 197
	i32 112, ; 198
	i32 326, ; 199
	i32 206, ; 200
	i32 57, ; 201
	i32 327, ; 202
	i32 268, ; 203
	i32 99, ; 204
	i32 19, ; 205
	i32 232, ; 206
	i32 111, ; 207
	i32 101, ; 208
	i32 102, ; 209
	i32 295, ; 210
	i32 104, ; 211
	i32 285, ; 212
	i32 71, ; 213
	i32 38, ; 214
	i32 32, ; 215
	i32 103, ; 216
	i32 73, ; 217
	i32 209, ; 218
	i32 301, ; 219
	i32 9, ; 220
	i32 123, ; 221
	i32 46, ; 222
	i32 222, ; 223
	i32 186, ; 224
	i32 9, ; 225
	i32 43, ; 226
	i32 4, ; 227
	i32 269, ; 228
	i32 188, ; 229
	i32 177, ; 230
	i32 325, ; 231
	i32 31, ; 232
	i32 138, ; 233
	i32 92, ; 234
	i32 93, ; 235
	i32 49, ; 236
	i32 141, ; 237
	i32 112, ; 238
	i32 140, ; 239
	i32 238, ; 240
	i32 115, ; 241
	i32 286, ; 242
	i32 157, ; 243
	i32 76, ; 244
	i32 79, ; 245
	i32 258, ; 246
	i32 37, ; 247
	i32 280, ; 248
	i32 242, ; 249
	i32 235, ; 250
	i32 64, ; 251
	i32 138, ; 252
	i32 15, ; 253
	i32 116, ; 254
	i32 274, ; 255
	i32 283, ; 256
	i32 230, ; 257
	i32 48, ; 258
	i32 70, ; 259
	i32 80, ; 260
	i32 126, ; 261
	i32 94, ; 262
	i32 121, ; 263
	i32 290, ; 264
	i32 26, ; 265
	i32 204, ; 266
	i32 251, ; 267
	i32 97, ; 268
	i32 28, ; 269
	i32 226, ; 270
	i32 296, ; 271
	i32 149, ; 272
	i32 169, ; 273
	i32 4, ; 274
	i32 98, ; 275
	i32 33, ; 276
	i32 93, ; 277
	i32 273, ; 278
	i32 182, ; 279
	i32 21, ; 280
	i32 41, ; 281
	i32 170, ; 282
	i32 312, ; 283
	i32 244, ; 284
	i32 304, ; 285
	i32 258, ; 286
	i32 289, ; 287
	i32 283, ; 288
	i32 263, ; 289
	i32 2, ; 290
	i32 134, ; 291
	i32 111, ; 292
	i32 183, ; 293
	i32 213, ; 294
	i32 321, ; 295
	i32 58, ; 296
	i32 95, ; 297
	i32 303, ; 298
	i32 39, ; 299
	i32 224, ; 300
	i32 25, ; 301
	i32 94, ; 302
	i32 297, ; 303
	i32 89, ; 304
	i32 99, ; 305
	i32 10, ; 306
	i32 87, ; 307
	i32 308, ; 308
	i32 100, ; 309
	i32 270, ; 310
	i32 178, ; 311
	i32 290, ; 312
	i32 215, ; 313
	i32 190, ; 314
	i32 300, ; 315
	i32 7, ; 316
	i32 177, ; 317
	i32 255, ; 318
	i32 212, ; 319
	i32 88, ; 320
	i32 250, ; 321
	i32 154, ; 322
	i32 299, ; 323
	i32 33, ; 324
	i32 116, ; 325
	i32 82, ; 326
	i32 205, ; 327
	i32 20, ; 328
	i32 200, ; 329
	i32 207, ; 330
	i32 11, ; 331
	i32 162, ; 332
	i32 3, ; 333
	i32 194, ; 334
	i32 307, ; 335
	i32 185, ; 336
	i32 183, ; 337
	i32 84, ; 338
	i32 294, ; 339
	i32 64, ; 340
	i32 309, ; 341
	i32 277, ; 342
	i32 143, ; 343
	i32 259, ; 344
	i32 157, ; 345
	i32 41, ; 346
	i32 117, ; 347
	i32 179, ; 348
	i32 214, ; 349
	i32 266, ; 350
	i32 131, ; 351
	i32 75, ; 352
	i32 66, ; 353
	i32 313, ; 354
	i32 172, ; 355
	i32 218, ; 356
	i32 143, ; 357
	i32 106, ; 358
	i32 151, ; 359
	i32 70, ; 360
	i32 307, ; 361
	i32 156, ; 362
	i32 189, ; 363
	i32 178, ; 364
	i32 121, ; 365
	i32 127, ; 366
	i32 308, ; 367
	i32 152, ; 368
	i32 241, ; 369
	i32 0, ; 370
	i32 141, ; 371
	i32 228, ; 372
	i32 305, ; 373
	i32 20, ; 374
	i32 14, ; 375
	i32 135, ; 376
	i32 75, ; 377
	i32 59, ; 378
	i32 0, ; 379
	i32 202, ; 380
	i32 231, ; 381
	i32 173, ; 382
	i32 167, ; 383
	i32 168, ; 384
	i32 192, ; 385
	i32 15, ; 386
	i32 74, ; 387
	i32 6, ; 388
	i32 23, ; 389
	i32 311, ; 390
	i32 253, ; 391
	i32 212, ; 392
	i32 91, ; 393
	i32 306, ; 394
	i32 1, ; 395
	i32 136, ; 396
	i32 310, ; 397
	i32 254, ; 398
	i32 276, ; 399
	i32 134, ; 400
	i32 69, ; 401
	i32 146, ; 402
	i32 315, ; 403
	i32 294, ; 404
	i32 245, ; 405
	i32 184, ; 406
	i32 88, ; 407
	i32 96, ; 408
	i32 235, ; 409
	i32 240, ; 410
	i32 310, ; 411
	i32 31, ; 412
	i32 45, ; 413
	i32 249, ; 414
	i32 189, ; 415
	i32 214, ; 416
	i32 109, ; 417
	i32 158, ; 418
	i32 35, ; 419
	i32 22, ; 420
	i32 114, ; 421
	i32 57, ; 422
	i32 274, ; 423
	i32 144, ; 424
	i32 118, ; 425
	i32 120, ; 426
	i32 110, ; 427
	i32 216, ; 428
	i32 139, ; 429
	i32 222, ; 430
	i32 296, ; 431
	i32 54, ; 432
	i32 105, ; 433
	i32 316, ; 434
	i32 193, ; 435
	i32 194, ; 436
	i32 133, ; 437
	i32 288, ; 438
	i32 279, ; 439
	i32 267, ; 440
	i32 322, ; 441
	i32 245, ; 442
	i32 196, ; 443
	i32 159, ; 444
	i32 232, ; 445
	i32 163, ; 446
	i32 132, ; 447
	i32 267, ; 448
	i32 161, ; 449
	i32 256, ; 450
	i32 140, ; 451
	i32 279, ; 452
	i32 275, ; 453
	i32 169, ; 454
	i32 195, ; 455
	i32 217, ; 456
	i32 284, ; 457
	i32 40, ; 458
	i32 243, ; 459
	i32 81, ; 460
	i32 56, ; 461
	i32 37, ; 462
	i32 97, ; 463
	i32 166, ; 464
	i32 172, ; 465
	i32 280, ; 466
	i32 82, ; 467
	i32 219, ; 468
	i32 98, ; 469
	i32 30, ; 470
	i32 159, ; 471
	i32 18, ; 472
	i32 127, ; 473
	i32 119, ; 474
	i32 239, ; 475
	i32 270, ; 476
	i32 252, ; 477
	i32 272, ; 478
	i32 165, ; 479
	i32 247, ; 480
	i32 329, ; 481
	i32 302, ; 482
	i32 269, ; 483
	i32 260, ; 484
	i32 170, ; 485
	i32 16, ; 486
	i32 144, ; 487
	i32 190, ; 488
	i32 125, ; 489
	i32 197, ; 490
	i32 118, ; 491
	i32 38, ; 492
	i32 115, ; 493
	i32 47, ; 494
	i32 142, ; 495
	i32 117, ; 496
	i32 199, ; 497
	i32 34, ; 498
	i32 176, ; 499
	i32 95, ; 500
	i32 53, ; 501
	i32 261, ; 502
	i32 129, ; 503
	i32 153, ; 504
	i32 24, ; 505
	i32 161, ; 506
	i32 238, ; 507
	i32 148, ; 508
	i32 104, ; 509
	i32 89, ; 510
	i32 226, ; 511
	i32 60, ; 512
	i32 142, ; 513
	i32 100, ; 514
	i32 5, ; 515
	i32 13, ; 516
	i32 201, ; 517
	i32 122, ; 518
	i32 135, ; 519
	i32 28, ; 520
	i32 302, ; 521
	i32 188, ; 522
	i32 72, ; 523
	i32 236, ; 524
	i32 24, ; 525
	i32 224, ; 526
	i32 265, ; 527
	i32 262, ; 528
	i32 319, ; 529
	i32 137, ; 530
	i32 203, ; 531
	i32 217, ; 532
	i32 233, ; 533
	i32 168, ; 534
	i32 266, ; 535
	i32 298, ; 536
	i32 101, ; 537
	i32 123, ; 538
	i32 237, ; 539
	i32 180, ; 540
	i32 163, ; 541
	i32 167, ; 542
	i32 240, ; 543
	i32 39, ; 544
	i32 191, ; 545
	i32 317, ; 546
	i32 17, ; 547
	i32 171, ; 548
	i32 318, ; 549
	i32 137, ; 550
	i32 150, ; 551
	i32 229, ; 552
	i32 155, ; 553
	i32 130, ; 554
	i32 19, ; 555
	i32 65, ; 556
	i32 147, ; 557
	i32 47, ; 558
	i32 326, ; 559
	i32 328, ; 560
	i32 215, ; 561
	i32 79, ; 562
	i32 199, ; 563
	i32 61, ; 564
	i32 106, ; 565
	i32 264, ; 566
	i32 219, ; 567
	i32 49, ; 568
	i32 250, ; 569
	i32 323, ; 570
	i32 261, ; 571
	i32 14, ; 572
	i32 179, ; 573
	i32 68, ; 574
	i32 171, ; 575
	i32 225, ; 576
	i32 229, ; 577
	i32 187, ; 578
	i32 78, ; 579
	i32 234, ; 580
	i32 108, ; 581
	i32 218, ; 582
	i32 260, ; 583
	i32 210, ; 584
	i32 67, ; 585
	i32 63, ; 586
	i32 27, ; 587
	i32 160, ; 588
	i32 298, ; 589
	i32 205, ; 590
	i32 227, ; 591
	i32 10, ; 592
	i32 191, ; 593
	i32 11, ; 594
	i32 78, ; 595
	i32 126, ; 596
	i32 83, ; 597
	i32 181, ; 598
	i32 66, ; 599
	i32 107, ; 600
	i32 65, ; 601
	i32 128, ; 602
	i32 122, ; 603
	i32 201, ; 604
	i32 77, ; 605
	i32 275, ; 606
	i32 265, ; 607
	i32 8, ; 608
	i32 233, ; 609
	i32 2, ; 610
	i32 208, ; 611
	i32 314, ; 612
	i32 44, ; 613
	i32 278, ; 614
	i32 156, ; 615
	i32 128, ; 616
	i32 263, ; 617
	i32 23, ; 618
	i32 133, ; 619
	i32 221, ; 620
	i32 252, ; 621
	i32 208, ; 622
	i32 29, ; 623
	i32 220, ; 624
	i32 62, ; 625
	i32 193, ; 626
	i32 90, ; 627
	i32 87, ; 628
	i32 148, ; 629
	i32 300, ; 630
	i32 195, ; 631
	i32 36, ; 632
	i32 86, ; 633
	i32 241, ; 634
	i32 324, ; 635
	i32 180, ; 636
	i32 50, ; 637
	i32 6, ; 638
	i32 90, ; 639
	i32 324, ; 640
	i32 21, ; 641
	i32 162, ; 642
	i32 96, ; 643
	i32 50, ; 644
	i32 113, ; 645
	i32 257, ; 646
	i32 130, ; 647
	i32 76, ; 648
	i32 27, ; 649
	i32 313, ; 650
	i32 234, ; 651
	i32 256, ; 652
	i32 7, ; 653
	i32 209, ; 654
	i32 192, ; 655
	i32 174, ; 656
	i32 110, ; 657
	i32 257, ; 658
	i32 243 ; 659
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
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
