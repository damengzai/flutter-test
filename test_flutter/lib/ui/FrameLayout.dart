import 'package:flutter/material.dart';

class FrameLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FrameLayoutPage();
}

class FrameLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FrameLayoutState();
}

class _FrameLayoutState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
                Positioned(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red
                  ),
                  left: 10,
                  top: 20,
                ),
                Positioned(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green
                  ),
                  bottom: 10,
                  right: 20,
                ),
                Positioned(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green
                  ),
                  bottom: 10,
                  left: 20,
                  width: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
