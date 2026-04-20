import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'leo_sdk_plugin_platform_interface.dart';

/// An implementation of [LeoSdkPluginPlatform] that uses method channels.
class MethodChannelLeoSdkPlugin extends LeoSdkPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('leo_sdk_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
