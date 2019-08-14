package com.ma.testflutter.view;

import android.content.Context;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class ATextView extends PlatformViewFactory {
    public ATextView(MessageCodec<Object> createArgsCodec) {
        super(createArgsCodec);
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return null;
    }
}
