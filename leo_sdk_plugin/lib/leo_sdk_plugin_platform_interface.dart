import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'leo_sdk_plugin_method_channel.dart';

abstract class LeoSdkPluginPlatform extends PlatformInterface {
  /// Constructs a LeoSdkPluginPlatform.
  LeoSdkPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static LeoSdkPluginPlatform _instance = MethodChannelLeoSdkPlugin();

  /// The default instance of [LeoSdkPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelLeoSdkPlugin].
  static LeoSdkPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LeoSdkPluginPlatform] when
  /// they register themselves.
  static set instance(LeoSdkPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
