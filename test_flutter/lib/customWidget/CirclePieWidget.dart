import 'dart:math';

import 'package:flutter/material.dart';

//饼状图
class CirclePieWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CirclePiePage();
  }
}

class _CirclePiePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CirclePieState();
  }
}

class _CirclePieState extends State<_CirclePiePage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List<Pie> pies = List()
    ..add(Pie(startPercent: 0, endPercent: 0.3, paintColor: Colors.redAccent))
    ..add(Pie(startPercent: 0.3, endPercent: 0.5, paintColor: Colors.amber))
    ..add(Pie(startPercent: 0.5, endPercent: 1, paintColor: Colors.blue));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this)..forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(100, 100),
            painter: _CirclePiePinter(controller: _controller, pies: pies),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _CirclePiePinter extends CustomPainter {
  final AnimationController controller;
  final List<Pie> pies;
  Tween<double> sweepTween;

  _CirclePiePinter({this.controller, this.pies})
      : assert(controller != null),
        assert(pies != null);

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..isAntiAlias = true;
    //绘制前景色
    _paint.color = Colors.blue;
    pies.forEach((Pie pie) {
      _paint.color = pie.paintColor;
      sweepTween = Tween<double>(begin: 0, end: (pie.endPercent - pie.startPercent) * pi * 2);
      canvas.drawArc(
          Rect.fromLTRB(0, 0, 100, 100), pie.startPercent * pi * 2, sweepTween.evaluate(controller), true, _paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Pie {
  double startPercent;
  double endPercent;
  Color paintColor;

  Pie({this.startPercent, this.endPercent, this.paintColor});
}
