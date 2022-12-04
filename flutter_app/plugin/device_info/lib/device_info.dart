
import 'dart:async';

import 'package:flutter/services.dart';

import 'device_info_platform_interface.dart';
class DeviceInfo {
  Future<String?> getPlatformVersion() {
    return DeviceInfoPlatform.instance.getPlatformVersion();
  }

  static const MethodChannel _channel = MethodChannel('device_info');

  static Future<String> get systemVersion async {
    final String version = await _channel.invokeMethod('getSystemVersion');
    return version;
  }

  static Future<String> get batteryLevel async {
    final String version = await _channel.invokeMethod('getBatteryLevel');
    return version;
  }
}
