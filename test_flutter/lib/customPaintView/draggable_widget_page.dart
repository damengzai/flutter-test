import 'package:flutter/material.dart';
import 'package:test_flutter/customPaintView/chess_vectors_flutter.dart';

class DraggableWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DraggableWidgetPageState();
  }
}

class _DraggableWidgetPageState extends State<DraggableWidgetPage> {
  ///这个是个啥？？？
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Draggable(
              data: 4,

              ///控制widget在拖动时，只能横向
//              axis: Axis.horizontal,

              ///停止的时候，显示的widget
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              ///正在拖动时，显示的widget
              feedback: Container(
                width: 50,
                height: 50,
                color: Colors.green,
                child: Center(
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),

              ///拖动的时候，在原始位置展示的widget
              childWhenDragging: Container(
                width: 50,
                height: 50,
              ),

              ///开始拖拽
              onDragStarted: () {
                print("----onDragStarted,开始拖拽");
              },

              ///拖拽到DragTarget且接受的时候回调
              onDragCompleted: () {
                print("----onDragCompleted,拖拽完成");
              },

              ///没有拖拽到DragTarget或拖拽没有完成的回调
              onDraggableCanceled: (v, offset) {
                print("----onDraggableCanceled,拖拽取消");
              },
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
              child: DragTarget(
                builder: (context, List<int> candidateData,
                    List<dynamic> rejectedData) {
                  ///candidateData，当Draggable被拖到DragTarget上的时候的data，已经准备好接受
                  print("----candidateData" + candidateData.toString());

                  ///rejectData，当Draggable被拖到DragTarget上的时候，不被接受
                  print("----rejectedData" + rejectedData.toString());

                  ///这两个数据都是正拖到上面的时候，还没放到上面，还没松手
                  return Center(
                    child: Text(candidateData.toString() +
                        "----" +
                        rejectedData.toString()),
                  );
                },

                ///接收Draggable的data数据，判断是否接收
                onWillAccept: (data) {
                  print("----onWillAccept,拖拽" + data.toString() + "到target");
                  if (data == 4) {
                    return true;
                  } else {
                    return false;
                  }
                },

                ///当拖到DragTarget的时候，松手后
                onAccept: (data) {
                  print("----onAccept,接收" + data.toString());
                  scaffoldKey.currentState
                      .showSnackBar(SnackBar(content: Text(data.toString())));
                },

                ///拖到上面，没有松手，又离开
                onLeave: (data) {
                  print("----onLeave,离开" + data.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
