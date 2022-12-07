import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'haptik_sdk.dart';
import 'haptik_sdk_platform_interface.dart';
import 'dart:convert';

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
    var customDataMap=signupData.setCustomData;
    String customDataString="{";
    if(customDataMap.containsKey("EMPTY_KEY"))
      {
        customDataString="NULL_VALUE";
      }
    else
      {
        customDataMap.forEach((key, value) {
          customDataString+="${key} : ${value},";
        });
        customDataString=customDataString.substring(0,customDataString.length-2);
        customDataString+="}";
      }
    var signupDataMap={'AuthCode':signupData.setAuthCode, 'AuthId':signupData.setAuthId,
      'SignupType': signupData.setSignupType, 'CustomData': customDataString};
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
  @override
  Future<String?> updateUserData(var userData) async
  {
    var userDataJson=json.encode(userData);
    final result = await methodChannel.invokeMethod<String>('updateUserData',userDataJson);
    return result;
  }
  @override
  Future<String?> destroy()async
  {
    final result = await methodChannel.invokeMethod<String>('destroy');
    return result;
  }

  @override
  Future<String?> getFormattedNotificationText(var data)async
  {
    final notificationText= await methodChannel.invokeMethod<String>('getFormattedNotificationText',data);
    return notificationText;
  }

  @override
  Future<String?>  handleNotification(var data)async
  {
    final result= await methodChannel.invokeMethod<String>('handleNotification',data);
    return result;
  }

  @override
  Future<bool?>  isHaptikNotification(var data)async
  {
    final result= await methodChannel.invokeMethod<String>('isHaptikNotification',data);
    bool boolResult=false;
    if(result=='true')
      {
        boolResult=true;
      }
    return boolResult;
  }

  @override
  Future<String?>  setNotificationToken(String data)async
  {
    final result= await methodChannel.invokeMethod<String>('setNotificationToken',data);
    return result;
  }
}
