import 'package:flutter/material.dart';

///基础的ListView
class RefreshListView extends StatefulWidget {
  final List listData; //列表数据
  final listItemView; //单个样式
  //构造函数
  const RefreshListView([this.listData, this.listItemView]) : super();

  @override
  State<StatefulWidget> createState() {
    return _RefreshListViewState();
  }
}

class _RefreshListViewState extends State<RefreshListView> {
  @override
  void initState() {
    super.initState();
    if(this.mounted) {
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
            itemCount: widget.listData.length,
            itemBuilder: (context, index) {
              if (widget.listItemView is Function) {
                return widget.listItemView(index, widget.listData[index]);
              }
            }),
        onRefresh: _handleRefresh);
  }

  //更新数据
  Future<Null> _handleRefresh() async {
    if (this.mounted) {
      //通过setState去更新UI
      setState(() {});
    }
  }
}
