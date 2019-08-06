import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MethodChannelPageState();
  }
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  static const platform = const MethodChannel('');

  //
  String _batteryLevel = '';

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
          ],
        ),
      ),
    );
  }
}
