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
  static const platform = const MethodChannel('testflutter');
  String _batteryLevel = '';
  String _batteryStatus = '';

  //方法通道的方法是异步的
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level $result .';
    } on PlatformException catch (e) {
      batteryLevel = 'Battery level unknown ${e.message}';
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
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
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _getBatteryLevel,
              child: const Text('getBatteryLevel'),
            ),
            Text(_batteryLevel),
            Text(_batteryStatus),
          ],
        ),
      ),
    );
  }
}
