package com.example.deviceinfo.device_info;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** DeviceInfoPlugin */
public class DeviceInfoPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "device_info");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getSystemVersion")) {
      result.success(android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("getBatteryLevel")) {
//      int rawLevel = intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1);
//      //获取总电量
//      int scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
//      int level = -1;
//      if(rawLevel >= 0 && scale > 0){
//        level = (rawLevel * 100) / scale;
//      }
      result.success("安卓电量待实现11");
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
