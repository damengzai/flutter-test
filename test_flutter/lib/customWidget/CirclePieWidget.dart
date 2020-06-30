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
  double _value = 0;
  List<Pie> pies = List()
    ..add(Pie(percent: 0.4, paintColor: Colors.redAccent))
    ..add(Pie(percent: 0.2, paintColor: Colors.amber))
    ..add(Pie(percent: 0.4, paintColor: Colors.blue));

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this)
      ..forward()
      ..addListener(() {
        _value = _controller.value;
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(100, 100),
          painter: _CirclePiePinter(value: _value, pies: pies),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _CirclePiePinter extends CustomPainter {
  double value;
  final List<Pie> pies;

//  Tween<double> sweepTween;

  _CirclePiePinter({this.value, this.pies})
      : assert(value != null),
        assert(pies != null);

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()..isAntiAlias = true;
    Rect centerRect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);
    //绘制前景色
    _paint.color = Colors.white;
    //当前绘制的比例
    double curTotalPercent = 0;
//    pies.forEach(
//      (Pie pie) {
//        _paint.color = pie.paintColor;
//        sweepTween = Tween<double>(begin: 0, end: pie.percent * pi * 2);
//        canvas.drawArc(centerRect, curTotalPercent * pi * 2, sweepTween.evaluate(controller), true, _paint);
//        curTotalPercent += pie.percent;
//      },
//    );

    for (var pie in pies) {
      _paint.color = pie.paintColor;
//      sweepTween = Tween<double>(begin: 0, end: pie.percent * pi * 2);
      double realAngle = value * pi * 2;
      if (realAngle >= pie.percent) {
        canvas.drawArc(centerRect, curTotalPercent * pi * 2, realAngle, true, _paint);
      }
//      canvas.drawArc(centerRect, curTotalPercent * pi * 2, sweepTween.evaluate(controller), true, _paint);
      curTotalPercent += pie.percent;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _CircleLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.blue;
    Path p = Path();
    p.cubicTo(0, 0, 0, 00, 100, 100);
    canvas.drawPath(p, _paint);
//    canvas.drawLine(Offset(0,0), Offset(100, 100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Pie {
  double percent; // 百分比
  double start; //开始的
  Color paintColor; // 颜色

  Pie({this.percent, this.paintColor});
}
