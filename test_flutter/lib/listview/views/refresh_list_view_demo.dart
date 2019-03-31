import 'package:flutter/material.dart';
import 'package:test_flutter/listview/conponents/refresh_list_view.dart';
import 'package:test_flutter/listview/conponents/list_view_item.dart';

///使用refresh_list_view

class RefreshListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '封装列表',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _RefreshListViewDemoStateful(),
    );
  }
}

class _RefreshListViewDemoStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RefreshListViewDemoState();
  }
}

class _RefreshListViewDemoState extends State<_RefreshListViewDemoStateful> {
  List<String> listData = ['Apple', 'Orange', 'Banana', 'Peach', 'Blueberry', 'Strawberry', 'Peanut', 'Watermelon'];

  Widget createListItem(index, data) {
    return ListViewItem(Key(index.toString()), data);
  }

  //获取列表数据
  Future<List> getListData([Map<String, dynamic> params]) async{
    dynamic testElement = params.values.elementAt(0);
    for(int i = 0; i < listData.length; i++) {
        listData[i] = listData[i]+testElement.toString();
    }
    return listData;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: RefreshListView(getListData, createListItem),
          ),
        ],
      ),
    );
  }
}
