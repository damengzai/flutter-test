import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'view/SearchPanel.dart';

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
  int _curTab = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        // Your code goes here.
        // To get index of current tab use tabController.index
        setState(() {
          _curTab = tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          SizedBox(
            height: 400,
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
            margin: EdgeInsets.only(top: 160),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  key: globalKey,
                  controller: tabController,
                  indicator: BoxDecoration(
                      color: Colors.white30, image: DecorationImage(image: AssetImage("assets/tabLeft.png"))),
                  indicatorColor: Colors.blue,
                  tabs: [
                    Text("国内港澳台", softWrap: false, overflow: TextOverflow.visible, style: TextStyle(color: Colors.red)),
                    Text("海外", style: TextStyle(color: Colors.red)),
                    Text("钟点房", style: TextStyle(color: Colors.red)),
                    Text("民宿", style: TextStyle(color: Colors.red)),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: SearchPanel(
                    curTab: _curTab,
                  ),
//                  TabBarView(
//                    controller: tabController,
//                    children: [
//                      SearchPanel(),
//                      Container(
//                        height: 50,
//                        width: MediaQuery.of(context).size.width - 20,
//                        child: Text("国内港澳台", style: TextStyle(fontSize: 40, color: Colors.blue)),
//                      ),
//                      Container(
//                        height: 50,
//                        width: MediaQuery.of(context).size.width - 20,
//                        child: Text("国内港澳台", style: TextStyle(fontSize: 40, color: Colors.blue)),
//                      ),
//                      Container(
//                        height: 50,
//                        width: MediaQuery.of(context).size.width - 20,
//                        child: Text("国内港澳台", style: TextStyle(fontSize: 40, color: Colors.blue)),
//                      )
//                    ],
//                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
