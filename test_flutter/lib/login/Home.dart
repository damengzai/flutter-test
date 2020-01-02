import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic obj = ModalRoute.of(context).settings.arguments;
    print(obj);
    return _HomePage();
  }
}

class _HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<_HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Hero(
          tag: 'login_header',
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('images/chair-alpha.png'),
                radius: 30,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
          ),
        ),
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Hero(
                  tag: 'login_header',
                  child: CircleAvatar(
                    child: Image.asset('images/chair-alpha.png'),
                    radius: 30,
                  ),
                ),
              ),
              Text('我的'),
              Text('设置'),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'backToHome',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            onTap: () => Navigator.of(context).pop('ok~~~'),
          ),
        ),
      ),
    );
  }
}
