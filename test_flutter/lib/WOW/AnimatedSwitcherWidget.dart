import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnimatedSwitcherPage();
  }
}

class _AnimatedSwitcherPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedSwitcherState();
  }
}

class _AnimatedSwitcherState extends State {
  int _counter = 0;

  _incrementCount() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          // 新child显示动画时长
          reverseDuration: Duration(milliseconds: 300),
          // 旧child隐藏动画时长
          switchInCurve: Curves.ease,
          switchOutCurve: Curves.bounceIn,
          transitionBuilder: (Widget child, Animation<double> animation) {
            var tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
            return SlideTransitionX(
              child: child,
              direction: AxisDirection.left,
              position:animation,
            );
//            return ScaleTransition(child: child, scale: animation);
          },
          child: Text(
            '$_counter',
            key: ValueKey<int>(_counter),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _incrementCount),
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX(
      {Key key,
      @required Animation<double> position,
      this.transformHitTests = true,
      this.direction = AxisDirection.down,
      this.child})
      : assert(position != null),
        super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
