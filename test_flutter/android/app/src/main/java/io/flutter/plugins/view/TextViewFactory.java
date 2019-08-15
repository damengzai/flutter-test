package io.flutter.plugins.view;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class TextViewFactory extends PlatformViewFactory {
    private TextView mTextView;

    public TextViewFactory(MessageCodec<Object> createArgsCodec) {
        super(createArgsCodec);
    }

    public TextViewFactory(MessageCodec<Object> createArgsCodec, TextView textView) {
        super(createArgsCodec);
        this.mTextView = textView;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return new PlatformView() {
            @Override
            public View getView() {
                return mTextView;
            }

            @Override
            public void dispose() {

            }
        };
    }
}
