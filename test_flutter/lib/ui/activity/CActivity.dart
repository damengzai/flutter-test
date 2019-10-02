import 'package:flutter/material.dart';

///仿写Android的Activity

class CActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CActivityPage();
}

class CActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CActivityState();
}

class _CActivityState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: const Text('标题'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
              onPressed: null,
            ),
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: null),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Text('center'),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'DrawerHeader',
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              Text('item1'),
              Text('item2'),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Mine'),
                backgroundColor: Colors.white),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
