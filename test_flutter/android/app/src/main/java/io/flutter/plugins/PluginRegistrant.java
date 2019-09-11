package io.flutter.plugins;

import android.content.Context;
import android.widget.Toast;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.view.FlutterView;

public class PluginRegistrant {
    public static final String METHOD_CHANNEL = "testflutter";
    public static final String EVENT_CHANNEL = "charging";

    public static void registerWith(PluginRegistry registry) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }
    }

    public static void registerWith(PluginRegistry registry, Context context, FlutterView flutterView) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }

        FlutterPluginBatteryLevel plugin = new FlutterPluginBatteryLevel(context);
        MethodChannel methodChannel = new MethodChannel(flutterView, METHOD_CHANNEL);
        methodChannel.setMethodCallHandler(plugin);
        plugin.setMethodChannel(methodChannel);

        BasicMessageChannel messageChannel = new BasicMessageChannel<>(flutterView, "messageChannel", StandardMessageCodec.INSTANCE);
        messageChannel.setMessageHandler(plugin);
        plugin.setBasicMessageChannel(messageChannel);

        EventChannel eventChannel = new EventChannel(flutterView, EVENT_CHANNEL);
        eventChannel.setStreamHandler(plugin);
    }

    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = PluginRegistrant.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        registry.registrarFor(key);
        return false;
    }
}
