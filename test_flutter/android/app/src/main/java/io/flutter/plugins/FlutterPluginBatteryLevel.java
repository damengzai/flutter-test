package io.flutter.plugins;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.util.Log;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

import static android.content.Context.BATTERY_SERVICE;

public class FlutterPluginBatteryLevel implements MethodChannel.MethodCallHandler, EventChannel.StreamHandler {
    private Context mContext;
    public FlutterPluginBatteryLevel(Context context){
        mContext = context;
    }
    @Override
    public void onListen(Object o, EventChannel.EventSink eventSink) {
        BroadcastReceiver chargingBroadcastReceiver = createChargingBroadcaseReceiver(eventSink);
        mContext.registerReceiver(chargingBroadcastReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
    }

    @Override
    public void onCancel(Object o) {

    }

    private BroadcastReceiver createChargingBroadcaseReceiver(EventChannel.EventSink eventSink) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {

                int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
                Log.e("----", "----onReceive" + status);
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    eventSink.error("UNAVALIABLE", "charging status is unavailable", null);
                } else {
                    boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING;
                    eventSink.success(isCharging ? "charging" : "disCharging");
                }
            }
        };
    }

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

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) mContext.getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(mContext.getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batteryLevel;
    }
}
