import 'package:flutter/material.dart';
import 'http.dart';
import 'dart:convert';

///网络请求
///
class RequestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RequestRouteState();
  }
}

class _RequestRouteState extends State<RequestRoute> {
  String _requestName = "";

  _requestData() {
    dio.get('https://postman-echo.com/get',
        queryParameters: {"name": "flutter"}).then((response) {
      print(response);
      Map<String, dynamic> responseJson = json.decode(response.toString());
      Map<String, dynamic> args = responseJson["args"];
      print(args["name"]);
      setState(() {
        _requestName = args["name"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: _requestData,
            child: Text('getData'),
          ),
          Text(_requestName),//如果随便写一个Text的父组件的话，Text的样式很奇葩-_-!。
        ],
      ),
    );
  }
}
