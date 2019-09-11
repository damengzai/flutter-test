package io.flutter.plugins.view;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class TextViewFactory extends PlatformViewFactory {
    private MessageCodec<Object> messageCodec;

    public TextViewFactory(MessageCodec<Object> createArgsCodec) {
        super(createArgsCodec);
        this.messageCodec = createArgsCodec;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return new MyTextview(context, messageCodec, i, (Map<String, Object>) o);
    }
}
