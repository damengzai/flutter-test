import 'package:flutter/material.dart';

// 显示动画
class TransitionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TransitionWidgetPage();
  }
}

class _TransitionWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransitionWidgetState();
  }
}

class _TransitionWidgetState extends State<_TransitionWidgetPage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _slideOffsetAnimation;
  Animation<double> _scaleDoubleAnimation;
  Animation<double> _rotationDoubleAnimation;
  Animation<double> _sizeDoubleAnimation;
  Animation<double> _fadeDoubleAnimation;
  Animation<RelativeRect> _positionedRelativeRectAnimation;
  Animation<Rect> _relativePositionedRectAnimation;
  Animation<Decoration> _decoratedBoxAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _slideOffsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutSine,
      ),
    );

    _scaleDoubleAnimation = Tween<double>(
      begin: double.minPositive,
      end: 1.2,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCirc,
      ),
    );

    _rotationDoubleAnimation = Tween<double>(
      begin: 0.0,
      end: 0.05,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutSine,
      ),
    );

    _sizeDoubleAnimation = Tween<double>(
      begin: 0.1,
      end: 1.1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInToLinear,
      ),
    );

    //Tween lerp方法只有begin + (end - begin) * t，对于复杂的参数，没有重写运算符（+、-）的话，要自己继承Tween重新lerp，所以使用官方对应的FooTween
    _positionedRelativeRectAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(1, 1, 1, 1),
      end: RelativeRect.fromLTRB(10, 10, 10, 10),
    ).animate(_controller);

    _relativePositionedRectAnimation = RectTween(
      begin: Rect.fromLTRB(1, 1, 1, 1),
      end: Rect.fromLTRB(10, 10, 10, 10),
    ).animate(_controller);

    _decoratedBoxAnimation = DecorationTween(
      begin: BoxDecoration(color: Colors.red, border: Border.all(color: Colors.blue), shape: BoxShape.rectangle),
      end: BoxDecoration(color: Colors.blue, border: Border.all(color: Colors.redAccent), shape: BoxShape.circle),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SlideTransition(
              position: _slideOffsetAnimation,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: _ViewWidget(
                  showText: 'SlideTransition',
                ),
              ),
            ),
            ScaleTransition(
              scale: _scaleDoubleAnimation,
              child: _ViewWidget(
                showText: 'ScaleTransition',
              ),
            ),
            RotationTransition(
              turns: _rotationDoubleAnimation,
              child: _ViewWidget(
                showText: 'RotationTransition',
              ),
            ),
            SizeTransition(
              sizeFactor: _sizeDoubleAnimation,
              child: _ViewWidget(
                showText: 'SizeTransition',
              ),
            ),
            FadeTransition(
              opacity: _controller,
              child: _ViewWidget(
                showText: 'FadeTransition',
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Stack(
                children: <Widget>[
                  PositionedTransition(
                    rect: _positionedRelativeRectAnimation,
                    child: _ViewWidget(
                      showText: 'PositionedTransition',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Stack(
                children: <Widget>[
                  RelativePositionedTransition(
                    rect: _relativePositionedRectAnimation,
                    size: Size(55, 55),
                    child: _ViewWidget(showText: 'RelativePositionedTransition'),
                  )
                ],
              ),
            ),
            DecoratedBoxTransition(
              decoration: _decoratedBoxAnimation,
              child: _ViewWidget(
                showText: 'DecoratedBoxTransition',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ViewWidget extends StatelessWidget {
  _ViewWidget({Key key, this.showText}) : super(key: key);
  final String showText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FlutterLogo(
          size: 50,
        ),
        Text(showText)
      ],
    );
  }
}
