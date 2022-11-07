import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'haptik_sdk.dart';
import 'haptik_sdk_platform_interface.dart';

/// An implementation of [HaptikSdkPlatform] that uses method channels.
class MethodChannelHaptikSdk extends HaptikSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('haptik_sdk');

  @override
  Future<String?> launchGuestConversation(InitData initData) async {
    String setNoHeaderString="false";
    if(initData.setNoHeader==true)
      {
        setNoHeaderString="true";
      }
    var initDataMap={'PrimaryColor':initData.setPrimaryColor, 'ComposerPlaceholder':initData.setComposerPlaceholder,
      'NoHeader':setNoHeaderString,'InitializeLanguage': initData.setInitializeLanguage};
    final message = await methodChannel.invokeMethod<String>('launchGuestConversation',initDataMap);
    return message;
  }
  @override
  Future<String?> launchCustomSignupConversation(SignupData signupData) async {
    var signupDataMap={'AuthCode':signupData.setAuthCode, 'AuthId':signupData.setAuthId,
      'SignupType': signupData.setSignupType};
    final message = await methodChannel.invokeMethod<String>('launchCustomSignupConversation',signupDataMap);
    return message;
  }
  @override
  Future<String?> logout() async {

    final message = await methodChannel.invokeMethod<String>('logout');
    return message;
  }
  @override
  Future<String?> setLaunchMessage(String message, bool hidden, bool skipMessage) async
  {
    String hiddenString="false";
    if(hidden==true)
      {
        hiddenString="true";
      }
    String skipMessageString="false";
    if(skipMessage==true)
      {
        skipMessageString="true";
      }
    var argData={'message': message,'hidden':hiddenString, 'skipMessage': skipMessageString};
    final result = await methodChannel.invokeMethod<String>('setLaunchMessage',argData);
    return result;
  }

}
