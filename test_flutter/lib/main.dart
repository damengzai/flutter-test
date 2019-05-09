import 'package:flutter/material.dart';
import 'package:test_flutter/dio/request.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/main_page.dart';
import 'package:test_flutter/fish_redux/main_page.dart';
import 'package:test_flutter/listview/views/refresh_list_view_demo.dart';
import 'package:test_flutter/viewpager/view_pager_demo.dart';

import 'animation/animated_container_app.dart';
import 'animation/explicit_animation/explicit_animation_page.dart';
import 'animation/fade_in_and_out_box.dart';
import 'customPaintView/draggable_widget_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/refreshList': (BuildContext context) => new RefreshListViewDemo(),
          //list列表页
          '/viewPager': (BuildContext context) => new ViewPagerDemo(),
          //viewpager
          '/request': (BuildContext context) => new RequestRoute(),
          //fish redux
          '/fishRedux': (BuildContext context) => new FishReduxMainPage(),
          //counter fish redux
          '/counterFishRedux': (BuildContext context) =>
          new CounterFishReduxPageStateless(),
          //Draggable
          '/draggable': (BuildContext context) => new DraggableWidgetPage(),
          //animation
          '/animation': (BuildContext context) => new AnimatedContainerApp(),
          //fadeInAndOutAnimation
          '/fadeInAndOutAnim': (BuildContext context) =>
          new FadeInAndOutBoxPage(),
          //explicitAnimation 显式动画，更多的实现自己的效果
          '/explicitAnimation': (
              BuildContext context) => new ExplicitAnimationPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _toRefreshListViewDemo() {
    Navigator.pushNamed(context, '/refreshList');
  }

  void _toViewPagerDemo() {
    Navigator.pushNamed(context, '/viewPager');
  }

  _toRequestRoute() {
    Navigator.pushNamed(context, '/request');
  }

  _toFishRedux() {
    Navigator.pushNamed(context, '/fishRedux');
  }

  _toCounterFishRedux() {
    Navigator.pushNamed(context, '/counterFishRedux');
  }

  _toDraggablePage() {
    Navigator.pushNamed(context, '/draggable');
  }

  _toAnimationPage() {
    Navigator.pushNamed(context, '/animation');
  }

  _toFadeInAndOutAnim() {
    Navigator.pushNamed(context, '/fadeInAndOutAnim');
  }

  _toExplicitAnimation() {
    Navigator.pushNamed(context, '/explicitAnimation');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            RaisedButton(
              onPressed: _toRefreshListViewDemo,
              child: Text("列表页"),
            ),
            RaisedButton(
              onPressed: _toViewPagerDemo,
              child: Text("Viewpager"),
            ),
            RaisedButton(
              onPressed: _toRequestRoute,
              child: Text("Request"),
            ),
            RaisedButton(
              onPressed: _toFishRedux,
              child: Text("FishRedux"),
            ),
            RaisedButton(
              onPressed: _toCounterFishRedux,
              child: Text("CounterFishRedux"),
            ),
            RaisedButton(
              onPressed: _toDraggablePage,
              child: Text("Draggable"),
            ),
            RaisedButton(
              onPressed: _toAnimationPage,
              child: Text("Animation"),
            ),
            RaisedButton(
              onPressed: _toFadeInAndOutAnim,
              child: Text("FadeInAndOut"),
            ),
            RaisedButton(onPressed: _toExplicitAnimation,
              child: Text("ExplicitAnimation"),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
