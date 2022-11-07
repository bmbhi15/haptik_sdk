
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
}