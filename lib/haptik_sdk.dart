
import 'haptik_sdk_platform_interface.dart';

class HaptikSdk {
  Future<String?> launchGuestConversation() {
    return HaptikSdkPlatform.instance.launchGuestConversation();
  }
}
