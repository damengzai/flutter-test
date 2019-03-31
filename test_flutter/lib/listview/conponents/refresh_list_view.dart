import 'package:flutter/material.dart';

///基础的ListView
class RefreshListView extends StatefulWidget {
  final listData; //列表数据
  final listItemView; //单个样式
  //构造函数
  const RefreshListView([this.listData, this.listItemView]) : super();

  @override
  State<StatefulWidget> createState() {
    return _RefreshListViewState();
  }
}

class _RefreshListViewState extends State<RefreshListView> {
  List items = new List(); //列表数据
  bool isLoading = false; //是否正在加载中
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    _loadMore();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //滚动到最后请求更多
        _loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (widget.listItemView is Function) {
              return widget.listItemView(index, items[index]);
            }
          },
          controller: _scrollController,
        ),
        onRefresh: _handleRefresh);
  }

  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }

  //模拟请求
  Future<List> mockHttpRequest() async {
    if (widget.listData is Function) {
      final listObject = await widget.listData({'page': 'A'});
      return listObject;
    } else {
      return [];
    }
  }

  //下拉更新数据
  Future<Null> _handleRefresh() async {
    if (this.mounted) {
      List newList = await mockHttpRequest();
      //通过setState去更新UI
      setState(() {
        items.clear();
        items.addAll(newList);
        isLoading = false;
        return null;
      });
    }
  }

  //加载更多
  Future _loadMore() async {
    if (!isLoading) {
      if(this.mounted) {
        setState(() {
          //通过setState去更新数据
          isLoading = true;
        });
      }
    }

    List moreList = await mockHttpRequest();
    if (this.mounted) {
      setState(() {
        items.addAll(moreList);
        isLoading = false;
      });
    }
  }
}
