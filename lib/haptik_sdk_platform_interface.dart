import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'haptik_sdk_method_channel.dart';

abstract class HaptikSdkPlatform extends PlatformInterface {
  /// Constructs a HaptikSdkPlatform.
  HaptikSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static HaptikSdkPlatform _instance = MethodChannelHaptikSdk();

  /// The default instance of [HaptikSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelHaptikSdk].
  static HaptikSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [HaptikSdkPlatform] when
  /// they register themselves.
  static set instance(HaptikSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> launchGuestConversation() {
    throw UnimplementedError('launchGuestConversation() has not been implemented.');
  }
}
