import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MethodChannelPageState();
  }
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  ///MethodChannel:Flutter调用Native方法
  static const methodChannel = const MethodChannel('testflutter');
  String _batteryLevel = '';
  String _batteryStatus = '';
  String _calledFromNative = '';
  String _replayFromNative = '';
  String _messageFromNative = '';

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
        setState(() {
          _calledFromNative = 'flutter method called from native with param ' + methodCall.arguments;
        });
        return 'flutter method called from native with param ' + methodCall.arguments;
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
    setState(() {
      _replayFromNative = reply;
    });
    return reply;
  }
  //Flutter接收Native发来的消息
  Future<dynamic> _receiveMessageFromNative(Object result) async {
    setState(() {
      _messageFromNative = result.toString();
    });
  }

  void _listenMessageFromNative() {
    basicMessageChannel.setMessageHandler(_receiveMessageFromNative);
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
    _listenMessageFromNative();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('-----------MethodChannel----------电池电量是Flutter调用native方法返回的值，called from native是native调用flutter方法，传递过来的值'),
              RaisedButton(
                onPressed: _getBatteryLevel,
                child: const Text('getBatteryLevel'),
              ),
              Text(_batteryLevel),
              Text(_calledFromNative),
              Text('-----------BasicMessageChannel----------'),
              RaisedButton(
                onPressed: () {
                  _sendMessageToNative('message');
                },
                child: const Text('发消息到native'),
              ),
              Text(_replayFromNative),
              Text(_messageFromNative),
              Text('--------------EventChannel--------------'),
              Text(_batteryStatus),
              Text('------------AndroidView-----------------'),
              Expanded(child: AndroidView(viewType: 'TextView'))
            ],
          ),
        ),
      ),
    );
  }
}
