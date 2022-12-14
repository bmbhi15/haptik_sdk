import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'InitData.dart';
import 'SignupData.dart';
abstract class HaptikSdkPlatform extends PlatformInterface {
  /// Constructs a HaptikSdkPlatform.
  HaptikSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  @visibleForTesting
  static final methodChannel = const MethodChannel('haptik_sdk');

  static Future<String?> launchGuestConversation(InitData initData) async {
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

  static Future<String?> launchCustomSignupConversation(SignupData signupData) async {
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

  static Future<String?> logout() async {

    final message = await methodChannel.invokeMethod<String>('logout');
    return message;
  }

 static Future<String?> setLaunchMessage(String message, bool hidden, bool skipMessage) async
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

  static Future<String?> updateUserData(var userData) async
  {
    var userDataJson=json.encode(userData);
    final result = await methodChannel.invokeMethod<String>('updateUserData',userDataJson);
    return result;
  }

 static Future<String?> destroy()async
  {
    final result = await methodChannel.invokeMethod<String>('destroy');
    return result;
  }


  static Future<String?> getFormattedNotificationText(var data)async
  {
    final notificationText= await methodChannel.invokeMethod<String>('getFormattedNotificationText',data);
    return notificationText;
  }


  static Future<String?>  handleNotification(var data)async
  {
    final result= await methodChannel.invokeMethod<String>('handleNotification',data);
    return result;
  }


 static  Future<bool?>  isHaptikNotification(var data)async
  {
    final result= await methodChannel.invokeMethod<String>('isHaptikNotification',data);
    bool boolResult=false;
    if(result=='true')
    {
      boolResult=true;
    }
    return boolResult;
  }


  static Future<String?>  setNotificationToken(String data)async
  {
    final result= await methodChannel.invokeMethod<String>('setNotificationToken',data);
    return result;
  }
}
