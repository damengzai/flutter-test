import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/page.dart';

class CounterFishReduxPageStateless extends StatelessWidget {
  final AbstractRoutes routes = HybridRoutes(routes: <AbstractRoutes>[
    PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'counter_fish_redux': CounterFishReduxPage(),
      },
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fish Redux',
      theme: ThemeData(primaryColor: Colors.orange),
      home: routes.buildPage('counter_fish_redux', null),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<Object>(builder: (BuildContext context) {
          return routes.buildPage(settings.name, settings.arguments);
        });
      },
    );
  }
}
