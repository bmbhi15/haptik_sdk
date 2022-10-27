import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'haptik_sdk_platform_interface.dart';

/// An implementation of [HaptikSdkPlatform] that uses method channels.
class MethodChannelHaptikSdk extends HaptikSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('haptik_sdk');

  @override
  Future<String?> launchGuestConversation() async {
    final version = await methodChannel.invokeMethod<String>('launchGuestConversation');
    return version;
  }
}
