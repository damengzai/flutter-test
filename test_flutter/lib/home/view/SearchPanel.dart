import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

//class SearchPanel extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) => _SearchPanelPage();
//}

class SearchPanel extends StatefulWidget {
  final int curTab;

  SearchPanel({Key key, @required this.curTab}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPanelState();
}

class _SearchPanelState extends State<SearchPanel> {
  TextEditingController tc = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    print("----===" + widget.curTab.toString());
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        color: Colors.amber,
      ),
      child: Column(
        children: [
          // 第一行，城市和定位
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      "天津",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25),
                    ),
                    Text(
                      "中国",
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Icon(Icons.location_searching),
                  onTap: () => {},
                ),
              ],
            ),
          ),
          //第二行，入离日期
          AnimatedContainer(
            duration: Duration(milliseconds: 600),
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "今天入住",
                      style: TextStyle(color: Colors.black45, fontSize: 10),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "11月18日",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "1晚",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  margin: EdgeInsets.only(left: widget.curTab == 1 ? 40 : 10),
                  child: Column(
                    children: [
                      Text(
                        "明天离店",
                        style: TextStyle(color: Colors.black45, fontSize: 10),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "11月19日",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return buildMultAnimation(animation, child);
                  },
                  child: getChildAdultWidget(widget.curTab),
                ),
              ],
            ),
          ),
          //第三行关键词
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextField(
              enabled: false,
              focusNode: _focusNode,
              controller: tc,
              decoration: InputDecoration(
                  labelText: null,
                  labelStyle: TextStyle(color: Colors.black87),
                  hintText: "试试搜：天津之眼",
                  hintStyle: TextStyle(color: Colors.black45),
                  border: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: Container(
                width: 200,
                margin: EdgeInsets.symmetric(vertical: 6),
                padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(colors: const [Colors.orangeAccent, Colors.orange])),
                child: Text(
                  "立即搜索酒店",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )),
          )
        ],
      ),
    );
  }

  Widget getChildAdultWidget(int tab) {
    return Column(
      children: [
        Text(
          "每间入住",
          style: TextStyle(color: Colors.black45, fontSize: 10),
        ),
        SizedBox(height: 4),
        Text(
          "成人1儿童1",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
//    return tab == 1 ? Column(
//      children: [
//        Text(
//          "每间入住",
//          style: TextStyle(color: Colors.black45, fontSize: 10),
//        ),
//        SizedBox(height: 4),
//        Text(
//          "成人1儿童1",
//          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
//        ),
//      ],
//    ) : Container();
  }

  Widget getEmpty(int tab) {
    double width = 99;
    if (tab == 1) {
      width = 100;
    } else {
      width = 0;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      width: width,
    );
  }

  SlideTransition buildMultAnimation(Animation<double> animation, Widget child, {int type = 0}) {
    Offset startOffset = Offset(1.0, 0.0);
    Offset endOffset = Offset(0.0, 0.0);
    if(type == 1) {
      startOffset = Offset(0.5, 0.0);
      endOffset = Offset(0.0, 0.0);
    }
    if (animation.status == AnimationStatus.completed) {
      print("----completed");
    }
    return SlideTransition(
      position: Tween(begin: startOffset, end: endOffset).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        ),
      ),
      child: child,
    );
  }
}
