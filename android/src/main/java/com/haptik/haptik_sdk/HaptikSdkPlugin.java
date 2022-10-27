package com.haptik.haptik_sdk;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import androidx.annotation.NonNull;

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
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "haptik_sdk");
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.getApplicationContext();
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("launchGuestConversation")) {
      launchGuestConversation();
      result.success("Guest Conversation was launched");
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
  public void launchGuestConversation(){
    InitData initData = new InitData();
    initData.setPrimaryColor("#420420");
    initData.setComposerPlaceholder("Test message");
    initData.setNoHeader(true);
    initData.setInitializeLanguage("en");
    HaptikSDK.INSTANCE.init(context, initData);
    HaptikSDK.INSTANCE.init(context, initData);
    HaptikSDK.INSTANCE.loadGuestConversation(new Function1<Response, Unit>() {
      @Override
      public Unit invoke(Response response) {
        return null;
      }
    });
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    // TODO: your plugin is now attached to an Activity
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
