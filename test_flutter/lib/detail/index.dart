import 'package:flutter/material.dart';
import './components/detailInfo.dart';
import './components/tabView.dart';

///常规的商品详情页
///头部轮播图-简介-tags-吸顶tab-切换锚点

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DetailPage();
  }
}

class _DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailState();
  }
}

class _DetailState extends State<_DetailPage> with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController, _contentScrollViewController;
  TabController _tabController;
  GlobalKey centerAnchor = GlobalKey();
  GlobalKey secondAnchor = GlobalKey();
  GlobalKey tabBarKey = GlobalKey();
  RenderBox box, secondBox;
  Offset offset, secondOffset;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _contentScrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _contentScrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      box = centerAnchor.currentContext.findRenderObject();
      offset = box.localToGlobal(Offset.zero);
      secondBox = secondAnchor.currentContext.findRenderObject();
      secondOffset = secondBox.localToGlobal(Offset.zero);
      print('object');
    });
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: double.infinity,
                  color: Colors.blue,
                  child: DetailInfo(),
                ),
              ),
              bottom: TabBar(
                key: tabBarKey,
                controller: _tabController,
                onTap: (int index) {
                  double top = MediaQuery.of(context).padding.top;
                  print('top' + top.toString());
//                  RenderBox box = centerAnchor.currentContext.findRenderObject();
//                  print('height:' + box.size.height.toString());
                  print('dx:' + offset.toString());
                  RenderBox tabBarBox = tabBarKey.currentContext.findRenderObject();
                  print('hei:' + tabBarBox.size.height.toString());
//                  print(offset.dy + MediaQuery.of(context).padding.top);
                  print('secondOffset: ' + secondOffset.toString());
                  print(index);
//                  _scrollViewController.jumpTo(0);
                  _contentScrollViewController.animateTo(1200, duration: Duration(seconds: 1), curve: Curves.easeInOutSine);
//                  if(index == 0) {
//                    _scrollViewController.animateTo(offset.dy - top - tabBarBox.size.height - 200,
//                        duration: Duration(seconds: 1), curve: Curves.easeInOutSine);
//                  } else {
//                    _scrollViewController.animateTo(secondOffset.dy - top - tabBarBox.size.height - 200,
//                        duration: Duration(seconds: 1), curve: Curves.easeInOutSine);
//                  }
                },
                tabs: [
                  Tab(text: '1'),
                  Tab(text: '2'),
                ],
              ),
            ),
          ];
        },
        body: CustomScrollView(
//          controller: _contentScrollViewController,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.redAccent,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                key: centerAnchor,
                height: 100,
                color: Colors.greenAccent,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                key: secondAnchor,
                height: 2100,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
