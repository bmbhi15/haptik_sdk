import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'haptik_sdk.dart';
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

  Future<String?> launchGuestConversation(InitData initData) {
    throw UnimplementedError('launchGuestConversation() has not been implemented.');
  }
  Future<String?> launchCustomSignupConversation(SignupData signupData) {
    throw UnimplementedError('launchCustomSignupConversation() has not been implemented.');
  }
  Future<String?> logout() {
    throw UnimplementedError('logout() has not been implemented.');
  }
  Future<String?> setLaunchMessage(String message, bool hidden, bool skipMessage)
  {
    throw UnimplementedError('setLaunchMessage() has not been implemented.');
  }
  Future<String?> updateUserData(var userData)
  {
    throw UnimplementedError('updateUserData() has not been implemented');
  }
  Future<String?> destroy()
  {
    throw UnimplementedError('destroy() has not been implemented');
  }
  Future<String?> getFormattedNotificationText(var data)
  {
    throw UnimplementedError('getFormattedNotificationText() has not been implemented');
  }

  Future<String?> handleNotification(var data)
  {
    throw UnimplementedError('handleNotification() has not been implemented');
  }

  Future<bool?> isHaptikNotification(var data)
  {
    throw UnimplementedError('isHaptikNotification() has not been implemented');
  }

  Future<String?> setNotificationToken(String data)
  {
    throw UnimplementedError('setNotificationToken() has not been implemented');
  }
}
