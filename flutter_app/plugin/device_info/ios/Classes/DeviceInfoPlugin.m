#import "DeviceInfoPlugin.h"

@implementation DeviceInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"device_info"
            binaryMessenger:[registrar messenger]];
  DeviceInfoPlugin* instance = [[DeviceInfoPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"getSystemVersion" isEqualToString:call.method]) {
    float level = [[UIDevice currentDevice] batteryLevel];
    result([NSString stringWithFormat:@"%f", level]);
  } else if ([@"getBatteryLevel" isEqualToString:call.method]) {
      result([[UIDevice currentDevice] systemVersion]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
