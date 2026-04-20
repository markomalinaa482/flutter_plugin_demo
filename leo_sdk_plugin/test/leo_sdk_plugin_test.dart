import 'package:flutter_test/flutter_test.dart';
import 'package:leo_sdk_plugin/leo_sdk_plugin.dart';
import 'package:leo_sdk_plugin/leo_sdk_plugin_platform_interface.dart';
import 'package:leo_sdk_plugin/leo_sdk_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLeoSdkPluginPlatform
    with MockPlatformInterfaceMixin
    implements LeoSdkPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LeoSdkPluginPlatform initialPlatform = LeoSdkPluginPlatform.instance;

  test('$MethodChannelLeoSdkPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLeoSdkPlugin>());
  });

  test('getPlatformVersion', () async {
    LeoSdkPlugin leoSdkPlugin = LeoSdkPlugin();
    MockLeoSdkPluginPlatform fakePlatform = MockLeoSdkPluginPlatform();
    LeoSdkPluginPlatform.instance = fakePlatform;

    expect(await leoSdkPlugin.getPlatformVersion(), '42');
  });
}
