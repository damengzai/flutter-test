import 'package:flutter/material.dart';
import 'package:test_flutter/customWidget/CirclePieWidget.dart';

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CustomWidgetPage();
  }
}

class _CustomWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomWidgetState();
  }
}

class _CustomWidgetState extends State<_CustomWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CirclePieWidget()),
    );
  }
}
