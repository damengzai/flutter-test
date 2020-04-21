import 'package:flutter/material.dart';

class ExplicitAnimationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ExplicitAnimationPage();
  }
}

class _ExplicitAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExplicitAnimationState();
  }
}

class _ExplicitAnimationState extends State<_ExplicitAnimationPage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.slowMiddle);
    animation = Tween<double>(begin: 10, end: 100).animate(_curvedAnimation);
    controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedBuilderWidget(animation: animation),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _AnimatedFlutterLogo extends AnimatedWidget {
  final Animation<double> animation;

  _AnimatedFlutterLogo({Key key, @required this.animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: animation.value,
      height: animation.value,
      child: FlutterLogo(),
    );
  }
}

class _CurveAnimatedFlutterLogo extends AnimatedWidget {
  final Animation<double> controller;

  _CurveAnimatedFlutterLogo({Key key, @required this.controller}) : super(key: key, listenable: controller);

  final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  final _sizeTween = Tween<double>(begin: 10, end: 200);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(controller),
      child: Container(
        width: _sizeTween.animate(controller).value,
        height: _sizeTween.evaluate(controller),
        child: FlutterLogo(),
      ),
    );
  }
}

class _AnimatedBuilderWidget extends StatelessWidget {
  _AnimatedBuilderWidget({Key key, this.child, this.animation}) : super(key: key);
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
    );
  }
}
