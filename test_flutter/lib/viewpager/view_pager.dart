import 'dart:async';

import 'package:flutter/material.dart';

///ViewPager的单个显示的item

class ViewPager extends StatefulWidget {
  final List<String> viewPagerData;
  final OnTapViewPagerItem onTap;

  ViewPager(this.viewPagerData, this.onTap, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePagerState();
  }
}

class _HomePagerState extends State<ViewPager> {
  int virtualIndex = 0;
  int realIndex = 1;

  PageController controller;
  Timer timer;
  PageController _transController = new PageController();
  var _currentPageValue = 0.0;

  PageController _entryController = new PageController();
  var _entryPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    controller = new PageController(initialPage: realIndex);
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      //实现自动滚动
      controller.animateToPage(realIndex + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    });

    _transController.addListener(() {
      setState(() {
        _currentPageValue = _transController.page;
      });
    });

    _entryController.addListener(() {
      setState(() {
        _entryPageValue = _entryController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //默认构造函数的ViewPager
        Container(
          height: 200,
          child: PageView(
            controller: controller,
            onPageChanged: _onPageChanged,
            children: _buildItems(), //滚动的view
          ),
        ),
        Container(height: 30, child: _buildIndicator()), //滚动的小点
        //使用PageView.builder
        //添加transformation
        Container(
          height: 200,
          child: PageView.builder(
              controller: _transController,
              itemCount: widget.viewPagerData.length,
              physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
              itemBuilder: (BuildContext context, int index) {
                if (index == _currentPageValue.floor()) {
                  //将要出去的item
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateX(_currentPageValue - index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      child: Image.network(
                        widget.viewPagerData[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else if (index == _currentPageValue.floor() + 1) {
                  //将要进来的item
                  return Transform(
                    transform: Matrix4.identity()
                      ..rotateX(_currentPageValue - index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      child: Image.network(
                        widget.viewPagerData[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                } else {
                  //其他，不在屏幕显示的item
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    child: Image.network(
                      widget.viewPagerData[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }
              }),
        ),
        Container(
          height: 200,
          child: PageView.custom(
            controller: _entryController,
            childrenDelegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index == _entryPageValue.floor()) {
                //出去的item
                return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.004)
                      ..rotateY(_entryPageValue - index)
                      ..rotateZ(_entryPageValue - index),
                    child: Image.network(
                      widget.viewPagerData[index],
                      fit: BoxFit.fill,
                    ));
              } else if (index == _entryPageValue.floor() + 1) {
                //进来的item
                return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.004)
                      ..rotateY(_entryPageValue - index)
                      ..rotateZ(_entryPageValue - index),
                    child: Image.network(
                      widget.viewPagerData[index],
                      fit: BoxFit.fill,
                    ));
              } else {
                return Image.network(
                  widget.viewPagerData[index],
                  fit: BoxFit.fill,
                );
              }
            }, childCount: widget.viewPagerData.length),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildItems() {
    //轮播图
    List<Widget> items = [];
    if (widget.viewPagerData.length > 0) {
      //头部添加一个尾部item，模拟循环
      items.add(
          _buildItem(widget.viewPagerData[widget.viewPagerData.length - 1]));
      //添加正常item
      items.addAll(widget.viewPagerData
          .map((imgUrl) => _buildItem(imgUrl))
          .toList(growable: false));
      //尾部
      items.add(_buildItem(widget.viewPagerData[0]));
    }
    return items;
  }

  Widget _buildItem(String imgUrl) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap(imgUrl);
        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  //创建轮播图点
  Widget _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < widget.viewPagerData.length; i++) {
      indicators.add(Container(
        //当有装饰组件作为子组件的时候，是一个装饰容器
        width: 6,
        height: 6,
        margin: EdgeInsets.symmetric(horizontal: 1.5, vertical: 10),
        decoration: BoxDecoration(
            //装饰组件，对装饰容器进行装饰用，添加颜色、图片、边框、圆角、阴影、渐变、背景混合、形状
            shape: BoxShape.circle,
            color: i == virtualIndex ? Colors.white : Colors.grey),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  _onPageChanged(int index) {
    realIndex = index;
    int count = widget.viewPagerData.length;
    if (index == 0) {
      virtualIndex = count - 1;
      controller.jumpToPage(count);
    } else if (index == count + 1) {
      virtualIndex = 0;
      controller.jumpToPage(1);
    } else {
      virtualIndex = index - 1;
    }
    setState(() {});
  }
}

typedef void OnTapViewPagerItem(String data);
