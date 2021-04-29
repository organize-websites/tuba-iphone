//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<better_player/FLTBetterPlayerPlugin.h>)
#import <better_player/FLTBetterPlayerPlugin.h>
#else
@import better_player;
#endif

#if __has_include(<path_provider/FLTPathProviderPlugin.h>)
#import <path_provider/FLTPathProviderPlugin.h>
#else
@import path_provider;
#endif

#if __has_include(<radio_player/RadioPlayerPlugin.h>)
#import <radio_player/RadioPlayerPlugin.h>
#else
@import radio_player;
#endif

#if __has_include(<url_launcher/FLTURLLauncherPlugin.h>)
#import <url_launcher/FLTURLLauncherPlugin.h>
#else
@import url_launcher;
#endif

#if __has_include(<volume_regulator/VolumeRegulatorPlugin.h>)
#import <volume_regulator/VolumeRegulatorPlugin.h>
#else
@import volume_regulator;
#endif

#if __has_include(<wakelock/WakelockPlugin.h>)
#import <wakelock/WakelockPlugin.h>
#else
@import wakelock;
#endif

#if __has_include(<webview_flutter/FLTWebViewFlutterPlugin.h>)
#import <webview_flutter/FLTWebViewFlutterPlugin.h>
#else
@import webview_flutter;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTBetterPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTBetterPlayerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [RadioPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"RadioPlayerPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
  [VolumeRegulatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"VolumeRegulatorPlugin"]];
  [WakelockPlugin registerWithRegistrar:[registry registrarForPlugin:@"WakelockPlugin"]];
  [FLTWebViewFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTWebViewFlutterPlugin"]];
}

@end
