import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:haptik_sdk/haptik_sdk_method_channel.dart';

void main() {
  MethodChannelHaptikSdk platform = MethodChannelHaptikSdk();
  const MethodChannel channel = MethodChannel('haptik_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.launchGuestConversation(), '42');
  });
}
