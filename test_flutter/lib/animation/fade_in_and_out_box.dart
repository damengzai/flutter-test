import 'package:flutter/material.dart';

class FadeInAndOutBoxPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FadeInAndOutBoxPageState();
}

class _FadeInAndOutBoxPageState extends State<FadeInAndOutBoxPage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeInAndOutBox"),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1 : 0,
          duration: Duration(seconds: 1),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _isVisible = !_isVisible;
        });
      }
      ,child: Icon(Icons.flip),),
    );
  }
}
