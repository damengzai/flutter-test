import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InkWell(
          child: Text("data1"),
          onTap: null,
        ),
        InkWell(
          child: Text("data2"),
          onTap: null,
        ),
        InkWell(
          child: Text("data3"),
          onTap: null,
        )
      ],
    );
  }
}
