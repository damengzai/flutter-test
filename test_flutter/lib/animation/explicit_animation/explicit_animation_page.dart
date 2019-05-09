import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ExplicitAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExplicitAnimationPageState();
}

//通过AnimationController控制动画
class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 150).animate(controller)
      ..addListener(() {
        //..addListener,中..语法的意思是在animate的返回值上调用addListener
        setState(() {});
      })
      ..addStatusListener((status) {
        //获取status，判断animation状态
        print('$status');
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    _curveAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          //demo1
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: animation.value,
            width: animation.value,
            child: FlutterLogo(),
          ),
          //demo2
          _AnimatedLogo(
            animation: animation,
          ),
          //demo3
          GrowTransition(
            child: _LogoWidget(),
            animation: animation,
          ),
          _CurveAnimatedLogo(animation: _curveAnimation)
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

//通过继承AnimatedWidget实现动画，这个时候不需要controller去控制setState了
///Examples of AnimatedWidgets in the Flutter API:
///AnimatedBuilder, AnimatedModal­Barrier, DecoratedBox­Transition,
///FadeTransition, Positioned­Transition, Relative­Positioned­Transition,
///RotationTransition, ScaleTransition, SizeTransition, SlideTransition.
class _AnimatedLogo extends AnimatedWidget {
  _AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}

//AnimationBuilder作为一个widget的build方法的一部分用于描述一个animation
//如果只是想自定义一个有可复用animation的widget，使用AnimationWidget即可
///Examples of AnimatedBuilders in the Flutter API:
///BottomSheet, ExpansionTile, PopupMenu, ProgressIndicator,
///RefreshIndicator, Scaffold, SnackBar, TabBar, TextField.
class _LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
      );
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
              height: animation.value,
              width: animation.value,
              child: child,
            ),
        child: child,
      ),
    );
  }
}

//复合动画
class _CurveAnimatedLogo extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 200);

  _CurveAnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
