import 'package:flutter/material.dart';

class LinearLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LinearLayoutPage();
}

class LinearLayoutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LinearLayoutState();
}

class _LinearLayoutState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.amberAccent,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    child: const Icon(
                      Icons.add_shopping_cart,
                      size: 50,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                    child: const Icon(
                      Icons.ac_unit,
                      size: 100,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.blue,
                    child: const Icon(
                      Icons.add_alarm,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
