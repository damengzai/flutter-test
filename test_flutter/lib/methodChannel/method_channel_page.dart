import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MethodChannelPageState();
  }
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  ///MethodChannel:Flutter调用Native
  static const methodChannel = const MethodChannel('testflutter');
  String _batteryLevel = '';
  String _batteryStatus = '';

  //Flutter调用Native方法
  //方法通道的方法是异步的
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level $result .';
    } on PlatformException catch (e) {
      batteryLevel = 'Battery level unknown ${e.message}';
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  //Native调用Flutter方法
  Future<dynamic> _addNativeMethod(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'flutterMethod':
        return 'flutter method called' + methodCall.arguments;
        break;
    }
  }

  void _addMethodForNative() {
    methodChannel.setMethodCallHandler(_addNativeMethod);
  }

  //Flutter发消息到native
  static const basicMessageChannel =
      BasicMessageChannel('messageChannel', StandardMessageCodec());

  Future<dynamic> _sendMessageToNative(String message) async {
    String reply = await basicMessageChannel.send(message);
    print(reply);
    return reply;
  }

  ///EventChannel:Native调用Flutter
  static const _eventChannel = const EventChannel('charging');

  void listenNativeEvent() {
    _eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object object) {
    String s = "Battery is ${object == 'charging' ? '' : 'dis'}Charging";
    setState(() {
      _batteryStatus = s;
    });
  }

  void _onError(Object err) {
    print("Battery status unknown");
  }

  @override
  void initState() {
    super.initState();
    listenNativeEvent();
    _addMethodForNative();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('-----------MethodChannel----------'),
              RaisedButton(
                onPressed: _getBatteryLevel,
                child: const Text('getBatteryLevel'),
              ),
              Text(_batteryLevel),
              Text('-----------BasicMessageChannel----------'),
              RaisedButton(
                onPressed: () {
                  _sendMessageToNative('message');
                },
                child: const Text('发消息到native'),
              ),
              Text(_batteryStatus),
              Expanded(child: AndroidView(viewType: 'TextView'))
            ],
          ),
        ),
      ),
    );
  }
}
