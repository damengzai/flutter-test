import 'package:flutter/material.dart';

class StackTop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StackTopState();
  }
}

class _StackTopState extends State<StackTop> {
  GlobalKey _anchorKey = GlobalKey();
  double opacity = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            ScrollMetrics metrics = notification.metrics;
            // 获取滚动的位置
            print(metrics.pixels);
            RenderBox anchorBox = _anchorKey.currentContext.findRenderObject();
            Offset anchorOffset = anchorBox.localToGlobal(Offset.zero);
            //锚点的位置
            print('----anchorOffset' + anchorOffset.dy.toString());
            if (anchorOffset.dy < MediaQuery.of(context).padding.top) {
              setState(() {
                opacity = 1;
              });
            } else {
              setState(() {
                opacity = 0;
              });
            }

            return true;
          },
          child: Stack(
            children: <Widget>[
              CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: Container(
                      height: 150,
                      color: Colors.redAccent,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                      key: _anchorKey,
                      children: <Widget>[Text('data'), Text('data'), Text('data')],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 150,
                      color: Colors.greenAccent,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 150,
                      color: Colors.blueAccent,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 150,
                      color: Colors.amberAccent,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 150,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 150,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 150,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Opacity(
                  opacity: opacity,
                  child: Row(
                  children: <Widget>[Text('data'), Text('data'), Text('data')],
                )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
