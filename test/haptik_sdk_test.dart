import 'package:flutter_test/flutter_test.dart';
import 'package:haptik_sdk/haptik_sdk.dart';
import 'package:haptik_sdk/haptik_sdk_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockHaptikSdkPlatform
    with MockPlatformInterfaceMixin
    implements HaptikSdkPlatform {

  @override
  Future<String?> launchGuestConversation() => Future.value('42');
}

void main() {
  final HaptikSdkPlatform initialPlatform = HaptikSdkPlatform.instance;

  test('$MethodChannelHaptikSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelHaptikSdk>());
  });

  test('getPlatformVersion', () async {
    HaptikSdk haptikSdkPlugin = HaptikSdk();
    MockHaptikSdkPlatform fakePlatform = MockHaptikSdkPlatform();
    HaptikSdkPlatform.instance = fakePlatform;

    expect(await haptikSdkPlugin.launchGuestConversation(), '42');
  });
}
