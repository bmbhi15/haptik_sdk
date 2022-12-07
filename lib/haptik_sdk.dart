
import 'haptik_sdk_platform_interface.dart';

class HaptikSdk {
  Future<String?> launchGuestConversation(InitData initData) {
    return HaptikSdkPlatform.instance.launchGuestConversation(initData);
  }
  Future<String?> launchCustomSignupConversation(SignupData signupData)
  {
    return HaptikSdkPlatform.instance.launchCustomSignupConversation(signupData);
  }
  Future<String?> logout()
  {
    return HaptikSdkPlatform.instance.logout();
  }
  Future<String?> setLaunchMessage(String message, bool hidden, bool skipMessage)
  {
    return HaptikSdkPlatform.instance.setLaunchMessage(message,hidden,skipMessage);
  }
  Future<String?> updateUserData(var userData)
  {
    return HaptikSdkPlatform.instance.updateUserData(userData);
  }
  Future<String?> destroy()
  {
    return HaptikSdkPlatform.instance.destroy();
  }
  Future<String?> getFormattedNotificationText(var data)
  {
    return HaptikSdkPlatform.instance.getFormattedNotificationText(data);
  }
  Future<String?> handleNotification(var data)
  {
    return HaptikSdkPlatform.instance.handleNotification(data);
  }

  Future<bool?> isHaptikNotification(var data)
  {
    return HaptikSdkPlatform.instance.isHaptikNotification(data);
  }
  Future<String?> setNotificationToken(String data)
  {
    return HaptikSdkPlatform.instance.setNotificationToken(data);
  }
}
class InitData{
  String setPrimaryColor="#420420";
  String setComposerPlaceholder="Type Message....";
  bool setNoHeader=true;
  String setInitializeLanguage="en";
}
class SignupData{

  String setAuthCode="YOUR_AUTH_CODE";
  String setAuthId="YOUR_AUTH_ID";
  String setSignupType="third_party";
  var setCustomData={"EMPTY_KEY":"EMPTY_VALUE"};
}