import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DismissibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DismissiblePage();
  }
}

class _DismissiblePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DismissibleWidgetState();
  }
}

class _DismissibleWidgetState extends State<_DismissiblePage> {
  //创建数组
  final itemList = List<String>.generate(10, (n) => "List item $n");
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final Map<DismissDirection, double> disThresholds = {
    DismissDirection.startToEnd: 0.3
  };

  ListView createItemsListView() {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return _createListItem(index);
      },
    );
  }

  Widget _createListItem(index) {
    return Dismissible(
      key: Key('${itemList[index]}'),
      child: InkWell(
        onTap: () {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text('clicked $index'),
            ),
          );
        },
        child: ListTile(
          title: Text('${itemList[index]}'),
        ),
      ),
      background: _leftBackground(),
      secondaryBackground: _rightBackground(),
      dismissThresholds: disThresholds,
      confirmDismiss: (direction) async {
        return _confDismiss(direction, index);
      },
      onDismissed: (direction) {
        return _onDismiss(direction);
      },
    );
  }

  Widget _leftBackground() {
    return Container(
      color: Colors.blue,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 20),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              "Edit",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget _rightBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              "Delete",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }

  _confDismiss(DismissDirection direction, index) async {
    if (direction == DismissDirection.endToStart) {
      bool res = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('确认要删除此条信息？'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('cancel'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      itemList.removeAt(index);
                    });
                  },
                  child: Text('ok'),
                ),
              ],
            );
          });
      return res;
    } else {
      //
    }
  }

  _onDismiss(DismissDirection direction) {
    if (direction == DismissDirection.startToEnd) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('编辑')));
    } else if (direction == DismissDirection.endToStart) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('删除')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: createItemsListView(),
    );
  }
}
