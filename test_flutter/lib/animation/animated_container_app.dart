import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  //定义参数的默认值
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer'),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: Duration(seconds: 1),
            //添加curve让动画看起来更顺畅
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_circle_filled),
            onPressed: () {
              setState(() {
                final random = Random();
                _width = random.nextInt(300).toDouble();
                _height = random.nextInt(300).toDouble();

                _color = Color.fromRGBO(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  1,
                );
                _borderRadius =
                    BorderRadius.circular(random.nextInt(100).toDouble());
              });
            }),
      ),
    );
  }
}
