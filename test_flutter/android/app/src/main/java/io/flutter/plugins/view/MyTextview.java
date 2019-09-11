package io.flutter.plugins.view;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import java.util.Map;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.platform.PlatformView;

public class MyTextview implements PlatformView {
    TextView t;
    public MyTextview(Context context, MessageCodec<Object> messenger, int id, Map<String, Object> params){
       TextView textView = new TextView(context);
       if (params.containsKey("text")){
           textView.setText(params.get("text").toString());
       }
       this.t = textView;
    }
    @Override
    public View getView() {
        return t;
    }

    @Override
    public void dispose() {

    }
}
