
import 'haptik_sdk_platform_interface.dart';
import 'InitData.dart';
import 'SignupData.dart';
class HaptikSdk {
  Future<String?> launchGuestConversation(InitData initData) {
    return HaptikSdkPlatform.launchGuestConversation(initData);
  }
  Future<String?> launchCustomSignupConversation(SignupData signupData)
  {
    return HaptikSdkPlatform.launchCustomSignupConversation(signupData);
  }
  Future<String?> logout()
  {
    return HaptikSdkPlatform.logout();
  }
  Future<String?> setLaunchMessage(String message, bool hidden, bool skipMessage)
  {
    return HaptikSdkPlatform.setLaunchMessage(message,hidden,skipMessage);
  }
  Future<String?> updateUserData(var userData)
  {
    return HaptikSdkPlatform.updateUserData(userData);
  }
  Future<String?> destroy()
  {
    return HaptikSdkPlatform.destroy();
  }
  Future<String?> getFormattedNotificationText(var data)
  {
    return HaptikSdkPlatform.getFormattedNotificationText(data);
  }
  Future<String?> handleNotification(var data)
  {
    return HaptikSdkPlatform.handleNotification(data);
  }

  Future<bool?> isHaptikNotification(var data)
  {
    return HaptikSdkPlatform.isHaptikNotification(data);
  }
  Future<String?> setNotificationToken(String data)
  {
    return HaptikSdkPlatform.setNotificationToken(data);
  }
}
