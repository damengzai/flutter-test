import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedCrossFadeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnimatedCrossFadePage();
  }
}

class _AnimatedCrossFadePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedCrossFadeState();
  }
}

class _AnimatedCrossFadeState extends State {
  bool _showFirst = true;

  _changeVisibleChild() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: AnimatedCrossFade(
            firstChild: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
            secondChild: Container(
              color: Colors.green,
              width: 100,
              height: 100,
            ),
            crossFadeState: _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 1000),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _changeVisibleChild),
    );
  }
}
