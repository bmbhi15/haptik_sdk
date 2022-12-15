import 'package:flutter/material.dart';
import 'dart:async';
import 'package:haptik_sdk/InitData.dart';
import 'package:haptik_sdk/SignupData.dart';
import 'package:flutter/services.dart';
import 'package:haptik_sdk/haptik_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _successState = 'Unknown';
  final _haptikSdkPlugin = HaptikSdk();
  final initData=InitData();
  final signupData=SignupData();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.


    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    String successState;
    successState='SDK is initialized';
    initData.setPrimaryColor="#00FF00";
    initData.setComposerPlaceholder="flutter_plugin_demo";
    initData.setInitializeLanguage="hi";
    initData.setNoHeader=false;
    // try {
    //
    //   successState=await _haptikSdkPlugin.initializeSDK() ?? 'SDK was not initialized';
    // } on PlatformException {
    //   successState = 'Failed to initialize SDK';
    // }
    setState(() {
      _successState = successState;
    });

    if (!mounted) return;

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
        child: Column(children: <Widget>[
        Container(
        margin: EdgeInsets.all(25),
        child: TextButton(
        child: Text('SignUp', style: TextStyle(fontSize: 20.0),),
        onPressed: () async {
          String successState;
              try {

                successState=await _haptikSdkPlugin.launchGuestConversation(initData) ?? 'Unknown success state';
              } on PlatformException {
                successState = 'Failed to launch guest conversation';
              }
          setState(() {
            _successState = successState;
          });
        },
        ),
        ),
        Container(
        margin: EdgeInsets.all(25),
        child: TextButton(
        child: Text('LogOut', style: TextStyle(fontSize: 20.0),),
    onPressed: () {},
    ),
    ),
          Container(
            margin: EdgeInsets.all(25),
            child: Text('Running on: $_successState\n'),
          ),
    ]
        ),
      ),
    ));
  }


}
