import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _QHomePageWidget();
}

class _QHomePageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QHomePageState();
}

class _QHomePageState<_QHomePageWidget> extends State with SingleTickerProviderStateMixin {
  TabController tabController;
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Text(
                    index.toString(),
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 200),
            margin: EdgeInsets.only(top: 250),
            width: MediaQuery.of(context).size.width - 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  key: globalKey,
                  controller: tabController,
                  indicator: BoxDecoration(color: Colors.black54),
                  indicatorColor: Colors.blue,
                  tabs: [
                    Text("国内港澳台", softWrap: false, overflow: TextOverflow.visible, style: TextStyle(color: Colors.red)),
                    Text("海外", style: TextStyle(color: Colors.red)),
                    Text("钟点房", style: TextStyle(color: Colors.red)),
                    Text("民宿", style: TextStyle(color: Colors.red)),
                  ],
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width - 20,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.black),
                        margin: EdgeInsets.only(left: 10),
                        height: 50,
                        child: Text("国内港澳台", style: TextStyle(fontSize: 40, color: Colors.blue)),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Text("国内港澳台", style: TextStyle(fontSize: 40, color: Colors.blue)),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Text("国内港澳台", style: TextStyle(fontSize: 40, color: Colors.blue)),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Text("国内港澳台", style: TextStyle(fontSize: 40, color: Colors.blue)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
