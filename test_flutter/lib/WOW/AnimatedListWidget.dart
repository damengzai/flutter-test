import 'package:flutter/material.dart';

class AnimatedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnimatedListPage();
  }
}

class _AnimatedListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedListState();
  }
}

class _AnimatedListState extends State<_AnimatedListPage> {
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}
