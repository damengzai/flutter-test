import 'package:flutter/material.dart' hide NestedScrollView, NestedScrollViewState;
import 'package:loading_more_list/loading_more_list.dart';
import 'package:ff_annotation_route/ff_annotation_route.dart';
import 'package:test_flutter/nesScrollView/common/common.dart';
import 'package:test_flutter/nesScrollView/lib/nested_scroll_view_inner_scroll_position_key_widget.dart';
import 'package:test_flutter/nesScrollView/lib/nested_scroll_view_refresh_indicator.dart';
import 'package:test_flutter/nesScrollView/lib/old_extended_nested_scroll_view.dart';

@FFRoute(
    name: "fluttercandies://scroll to top",
    routeName: "scroll to top",
    description:
        "how to scroll list to top in NestedScrollView's body without ScrollController")
class ScrollToTopDemo extends StatefulWidget {
  @override
  _ScrollToTopDemoState createState() => _ScrollToTopDemoState();
}

class _ScrollToTopDemoState extends State<ScrollToTopDemo>
    with TickerProviderStateMixin {
  TabController primaryTC;
  GlobalKey<NestedScrollViewState> _key = GlobalKey<NestedScrollViewState>();
  @override
  void initState() {
    primaryTC = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    primaryTC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScaffoldBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.file_upload),
        onPressed: () {
          ///scroll current tab list
          _key.currentState.currentInnerPosition.animateTo(0.0,
              duration: Duration(seconds: 1), curve: Curves.easeIn);

          ///scroll all tab list
          // _key.currentState.innerScrollPositions.forEach((position) {
          //   position.animateTo(0.0,
          //       duration: Duration(seconds: 1), curve: Curves.easeIn);
          // });
        },
      ),
    );
  }

  Widget _buildScaffoldBody() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    var pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight;
    return NestedScrollViewRefreshIndicator(
      onRefresh: onRefresh,
      child: NestedScrollView(
          key: _key,
          headerSliverBuilder: (c, f) {
            return [
              SliverAppBar(
                  pinned: true,
                  expandedHeight: 200.0,
                  title: Text("scroll to top"),
                  flexibleSpace: FlexibleSpaceBar(
                      //centerTitle: true,
                      collapseMode: CollapseMode.pin,
                      background: Image.asset(
                        "assets/467141054.jpg",
                        fit: BoxFit.fill,
                      )))
            ];
          },
          //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
          pinnedHeaderSliverHeightBuilder: () {
            return pinnedHeaderHeight;
          },
          //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
          innerScrollPositionKeyBuilder: () {
            var index = "Tab";

            index += primaryTC.index.toString();

            return Key(index);
          },
          body: Column(
            children: <Widget>[
              TabBar(
                controller: primaryTC,
                labelColor: Colors.blue,
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2.0,
                isScrollable: false,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Tab0"),
                  Tab(text: "Tab1"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: primaryTC,
                  children: <Widget>[
                    NestedScrollViewInnerScrollPositionKeyWidget(
                      Key("Tab0"),
                      GlowNotificationWidget(
                        ListView.builder(
                          //store Page state
                          key: PageStorageKey("Tab0"),
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (c, i) {
                            return Container(
                              alignment: Alignment.center,
                              height: 60.0,
                              child:
                                  Text(Key("Tab0").toString() + ": ListView$i"),
                            );
                          },
                          itemCount: 50,
                        ),
                        showGlowLeading: false,
                      ),
                    ),
                    NestedScrollViewInnerScrollPositionKeyWidget(
                      Key("Tab1"),
                      GlowNotificationWidget(
                        ListView.builder(
                          //store Page state
                          key: PageStorageKey("Tab1"),
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (c, i) {
                            return Container(
                              alignment: Alignment.center,
                              height: 60.0,
                              child:
                                  Text(Key("Tab1").toString() + ": ListView$i"),
                            );
                          },
                          itemCount: 50,
                        ),
                        showGlowLeading: false,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
