import 'package:flutter/material.dart';

class TweenAnimationBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _TweenAnimationBuilderPage();
  }
}

class _TweenAnimationBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TweenAnimationBuilderState();
  }
}

class _TweenAnimationBuilderState extends State<_TweenAnimationBuilderPage> {
  double _targetValue = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => setState(() {
            _targetValue = _targetValue == 24 ? 48 : 24;
          }),
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: _targetValue),
            duration: Duration(seconds: 1),
            builder: (BuildContext context, double value, Widget child) {
              return Container(
                width: value,
                height: value,
                child: child,
              );
            },
            child: FlutterLogo(
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
