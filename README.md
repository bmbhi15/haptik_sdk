# haptik_sdk

This is an implementation of the HAPTIK's SDK library in Flutter. 
## Getting Started

##Installation of SDK

###Prerequisites
To Integrate Haptik SDK, you must obtain the following credentials to get started:

1. Client ID/Account ID (Required): Unique Haptik identification number associated with your account.
2. Business ID (Required): Unique business identification number.
3. Base URL (Required): Link pointing to specific server environment (Different for Staging and Production)
4. Auth Type: authentication type to be used for user registration. Required only for custom signup.
5. Auth ID:authentication type to be used for user registration. Required only for custom signup.

####Add Haptik SDK in your flutter project

#####Depend on it

Run this command with flutter:
```
flutter pub add haptik_sdk
```
This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
```
dependencies:
haptik_sdk: ^0.0.6
```
Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.
#####Import it

Now in your Dart code, you can use:
```
import 'package:haptik_sdk/haptik_sdk.dart';
```

###Setting up credentials and environment for Flutter plugin

The Haptik SDK will take in the required credentials in your flutter project through the android part. You'll have to add to
in the strings.xml folder which resides in the following path:
android/app/main/res/values
If you don't have strings.xml in values folder, then you can even add the file yourself
In strings.xml :
```
<resources>
    <string name="haptik_base_url">PROVIDED_BASE_URL</string>
    <string name="haptik_client_id">PROVIDED_CLIENT_ID</string>
    <string name="haptik_business_id">PROVIDED_BUSINESS_ID</string>
</resources>
```
This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

