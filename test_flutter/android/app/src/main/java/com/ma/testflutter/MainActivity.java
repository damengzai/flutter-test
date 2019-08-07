package com.ma.testflutter;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

/**
 * Flutter调用Native方法，返回基础数据到Flutter
 * Flutter调用Native方法，返回自定义数据到Flutter
 * Native桥接View给Flutter使用
 */
public class MainActivity extends FlutterActivity {
    public static final String CHANNEL = "testflutter";
    public static final String EVENT_CHANNEL = "charging";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        //1. MethodChannel Flutter调用native部分
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if (methodCall.method.equals("getBatteryLevel")) {
                    int batteryLevel = getBatteryLevel();
                    if (batteryLevel != -1) {
                        result.success(batteryLevel);
                    } else {
                        result.error("UNAVALIABLE", "battery level unavaliable", null);
                    }
                } else {
                    result.notImplemented();
                }
            }
        });

        new EventChannel(getFlutterView(), EVENT_CHANNEL).setStreamHandler(new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object o, EventChannel.EventSink eventSink) {
                Log.e("----","----onListen");
                BroadcastReceiver chargingBroadcastReceiver = createChargingBroadcaseReceiver(eventSink);
                MainActivity.this.registerReceiver(chargingBroadcastReceiver,new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            }

            @Override
            public void onCancel(Object o) {

            }
        });
    }


    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }

    private BroadcastReceiver createChargingBroadcaseReceiver(EventChannel.EventSink eventSink) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {

                int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
                Log.e("----","----onReceive"+status);
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    eventSink.error("UNAVALIABLE", "charging status is unavailable", null);
                } else {
                    boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING;
                    eventSink.success(isCharging ? "charging" : "disCharging");
                }
            }
        };
    }
}
