import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final title;

  const ListViewItem(Key key, this.title) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 30.0),
        child: Text(
          this.title,
          style: new TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
