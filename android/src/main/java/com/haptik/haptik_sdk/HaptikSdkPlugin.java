package com.haptik.haptik_sdk;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;

import ai.haptik.android.wrapper.sdk.model.SignupData;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import androidx.annotation.NonNull;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import ai.haptik.android.wrapper.sdk.HaptikSDK;
import ai.haptik.android.wrapper.sdk.model.InitData;
import ai.haptik.android.wrapper.sdk.model.Response;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/** HaptikSdkPlugin */
public class HaptikSdkPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware{
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity

  private MethodChannel channel;
  private Context context;
  private Activity activity;
  InitData initData = new InitData();
  SignupData signupData = new SignupData();
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "haptik_sdk");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {



    if (call.method.equals("launchGuestConversation")) {
      HashMap<String,String> initDataMap= (HashMap<String, String>) call.arguments;
      launchGuestConversation(initDataMap);
      result.success("Guest Conversation was launched");
    }

    if(call.method.equals("launchCustomSignupConversation")){
      HashMap<String,String> signupDataMap= (HashMap<String, String>) call.arguments;
      try {
        launchCustomSignupConversation(signupDataMap);
      } catch (JSONException e) {
        e.printStackTrace();
      }
      result.success("Custom Conversation was launched");
    }

    if(call.method.equals("logout")){
      HaptikSDK.INSTANCE.logout(context);
      result.success("You were logged out successfully");
    }

    if(call.method.equals("setLaunchMessage"))
    {
      HashMap<String,String> argDataMap= (HashMap<String, String>) call.arguments;
      boolean hidden=false;
      if(argDataMap.get("hidden")=="true")
      {
        hidden=true;
      }
      boolean skipMessage=false;
      if(argDataMap.get("skipMessage")=="true")
      {
        skipMessage=true;
      }
      //Documenatation says that setLaunchMessage takes only 2 arguments
      HaptikSDK.INSTANCE.setLaunchMessage((String)argDataMap.get("message"),hidden);
      result.success("Launch message was set");
    }
    if(call.method.equals("updateUserData"))
    {
        JSONObject userDataJSONObj=(JSONObject) call.arguments;
        HaptikSDK.INSTANCE.updateUserData(userDataJSONObj);
        result.success("User Data was updated");
    }
    if(call.method.equals("destroy"))
    {
      HaptikSDK.INSTANCE.destroy();
      result.success("Haptik INSTANCE was successfully destroyed");
    }
    if(call.method.equals("getFormattedNotificationText"))
    {
      HashMap<String,String> map=(HashMap<String, String>) call.arguments;
      String notificationText=HaptikSDK.INSTANCE.getFormattedNotificationText(map,context);
      result.success(notificationText);
    }
//    if(call.method.equals("handleNotification"))
//    {
//      HashMap<String,String> map=(HashMap<String, String>) call.arguments;
//      HaptikSDK.INSTANCE.handleNotification(context,map,R.mipmap.ic_launcher);
//      result.success("Notifications were handled");
//    }
    if(call.method.equals("isHaptikNotification"))
    {
      HashMap<String,String> map=(HashMap<String, String>) call.arguments;
      boolean res=HaptikSDK.INSTANCE.isHaptikNotification(map);
      String resString="false";
      if(res==true)
      {
        resString="true";
      }
      result.success(resString);
    }
    if(call.method.equals("setNotificationToken"))
    {
      String s=(String) call.arguments;
      HaptikSDK.INSTANCE.setNotificationToken(context,s);

      result.success("Notification Token was successfully set");
    }

  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
  public void launchGuestConversation(HashMap<String,String> initDataMap){
    initData.setPrimaryColor((String)initDataMap.get("PrimaryColor"));
    initData.setComposerPlaceholder((String)initDataMap.get("ComposerPlaceholder"));
    boolean noHeader= initDataMap.get("NoHeader") == "true";
    initData.setNoHeader(noHeader);
    initData.setInitializeLanguage((String)initDataMap.get("InitializeLanguage"));
    String baseUrl=(String)initDataMap.get("setBase_url");

    if(!(baseUrl.equals("NULL_VALUE")))
    {
      initData.setBase_url(baseUrl);
    }
    boolean botType=initDataMap.get("setBotType")=="true";
    initData.setBotType(botType);
    boolean typingSuggestion=initDataMap.get("setEnableTypingSuggestions")=="true";
    initData.setEnableTypingSuggestions(typingSuggestion);
    boolean EnableUserFeedback=initDataMap.get("setEnableUserFeedback")=="true";
    initData.setEnableUserFeedback(EnableUserFeedback);
    boolean IgnoreStorage=initDataMap.get("setIgnoreStorage")=="true";
    initData.setIgnoreStorage(IgnoreStorage);
    HaptikSDK.INSTANCE.init(context, initData);
    HaptikSDK.INSTANCE.loadGuestConversation(new Function1<Response, Unit>() {
      @Override
      public Unit invoke(Response response) {
        return null;
      }
    });
  }
  public void launchCustomSignupConversation(HashMap<String,String> signupDataMap) throws JSONException {
    InitData initData = new InitData();
    initData.setPrimaryColor("#420420");
    initData.setComposerPlaceholder("Test message");
    initData.setNoHeader(true);
    initData.setInitializeLanguage("en");
    HaptikSDK.INSTANCE.init(context, initData);
    signupData.setAuthCode((String)signupDataMap.get("AuthCode"));
    signupData.setAuthId((String)signupDataMap.get("AuthId"));
    signupData.setSignupType((String)signupDataMap.get("SignupType"));
    String customData= (String)signupDataMap.get("CustomData");
    if(customData.equals("NULL_VALUE"))
    {
      JSONObject jsonObject = new JSONObject();
      jsonObject.put("custom-data-wrapper-one", "data-one");
      jsonObject.put("custom-data-wrapper-two", "data-two");
      signupData.setCustomData(jsonObject);

    }
    else
    {
      Map<String, String> myMap = new HashMap<String, String>();

      String[] pairs = customData.split(",");

      for (int i=0;i<pairs.length;i++) {
        String pair = pairs[i];
        String[] keyValue = pair.split(":");
        myMap.put(keyValue[0], String.valueOf(keyValue[1]));
      }

      JSONObject jsonObject = new JSONObject(myMap);
      signupData.setCustomData(jsonObject);

    }

    HaptikSDK.INSTANCE.loadConversation(signupData,new Function1<Response, Unit>() {
      @Override
      public Unit invoke(Response response) {
        return null;
      }
    });
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    // TODO: your plugin is now attached to an Activity
    // New pull request

    activity = activityPluginBinding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    // TODO: the Activity your plugin was attached to was
    // destroyed to change configuration.
    // This call will be followed by onReattachedToActivityForConfigChanges().
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {
    // TODO: your plugin is now attached to a new Activity
    // after a configuration change.
  }

  @Override
  public void onDetachedFromActivity() {
    // TODO: your plugin is no longer associated with an Activity.
    // Clean up references.
  }

}
