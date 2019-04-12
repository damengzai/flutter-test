import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/page.dart';
import 'package:test_flutter/fish_redux/todo_edit_page/page.dart';
import 'package:test_flutter/fish_redux/todo_list_page/page.dart';

class FishReduxMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FishReduxMainPageStateful();
  }
}

class _FishReduxMainPageStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FishReduxMainPageState();
}

class _FishReduxMainPageState extends State<_FishReduxMainPageStateful> {
  AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(pages: <String, Page<Object, dynamic>>{
      'todo_list': TodoListPage(),
      'todo_edit': TodoEditPage(),
    },),
  ]);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fish Redux",
      theme: ThemeData(primaryColor: Colors.orange),
      home:routes.buildPage('todo_edit', null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}
