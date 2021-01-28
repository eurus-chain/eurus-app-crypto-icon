#import "AppCryptoIconsPlugin.h"
#if __has_include(<app_crypto_icons/app_crypto_icons-Swift.h>)
#import <app_crypto_icons/app_crypto_icons-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "app_crypto_icons-Swift.h"
#endif

@implementation AppCryptoIconsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppCryptoIconsPlugin registerWithRegistrar:registrar];
}
@end
