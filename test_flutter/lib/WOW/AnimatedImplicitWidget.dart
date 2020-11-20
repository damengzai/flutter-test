import 'package:flutter/material.dart';

class AnimatedImplicitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnimatedPage();
  }
}

class _AnimatedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedState();
  }
}

class _AnimatedState extends State<_AnimatedPage> with SingleTickerProviderStateMixin {
  bool _containerSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          // AnimatedContainer
          AnimatedContainer(
            duration: Duration(seconds: 2),
            width: _containerSelected ? 200.0 : 100.0,
            height: _containerSelected ? 100.0 : 200.0,
            alignment: _containerSelected ? Alignment.center : AlignmentDirectional.topCenter,
            decoration: BoxDecoration(
              color: _containerSelected ? Colors.red : Colors.blue,
              border: Border.all(width: _containerSelected ? 4 : 1),
              borderRadius: BorderRadius.all(
                Radius.circular(_containerSelected ? 4 : 1),
              ),
            ),
            curve: Curves.fastOutSlowIn,
            child: Stack(
              children: <Widget>[
                FlutterLogo(size: 75),
                Text("AnimatedContainer"),
              ],
            ),
          ),
          //AnimatedPadding
          AnimatedPadding(
            duration: Duration(seconds: 2),
            padding: EdgeInsets.all(_containerSelected ? 20 : 1),
            curve: Curves.fastOutSlowIn,
            child: Stack(
              children: <Widget>[
                FlutterLogo(size: 75),
                Text("AnimatedPadding"),
              ],
            ),
          ),
          // AnimatedAlign
          AnimatedAlign(
            alignment: _containerSelected ? Alignment.topLeft : Alignment.bottomRight,
            duration: Duration(seconds: 2),
            child: Stack(
              children: <Widget>[
                FlutterLogo(size: 75),
                Text("AnimatedAlign"),
              ],
            ),
            curve: Curves.easeInOut,
          ),
          //AnimatedPositioned
          Stack(
            children: <Widget>[
              AnimatedPositioned(
                child: Stack(
                  children: <Widget>[
                    FlutterLogo(size: 75),
                    Text("AnimatedPositioned"),
                  ],
                ),
                duration: Duration(seconds: 2),
                left: _containerSelected ? 0 : 10,
                top: _containerSelected ? 0 : 10,
                curve: Curves.easeInOutSine,
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              AnimatedPositionedDirectional(
                child: Stack(
                  children: <Widget>[
                    FlutterLogo(size: 75),
                    Text("AnimatedPositionedDirectional"),
                  ],
                ),
                duration: Duration(seconds: 2),
                start: _containerSelected ? 0 : 10,
                top: _containerSelected ? 0 : 10,
              )
            ],
          ),
          AnimatedOpacity(
            opacity: _containerSelected ? 1 : 0.4,
            duration: Duration(seconds: 2),
            child: Stack(
              children: <Widget>[
                FlutterLogo(size: 75),
                Text("AnimatedOpacity"),
              ],
            ),
          ),
          AnimatedDefaultTextStyle(
            child: Text("AnimatedDefaultTextStyle"),
            style: TextStyle(
                color: _containerSelected ? Colors.red : Colors.blue,
                fontSize: _containerSelected ? 12 : 16,
                fontStyle: _containerSelected ? FontStyle.normal : FontStyle.italic,
                backgroundColor: _containerSelected ? Colors.white : Colors.grey),
            textAlign: _containerSelected ? TextAlign.left : TextAlign.right,
            duration: Duration(seconds: 2),
          ),
          AnimatedPhysicalModel(
            child: Center(
              child: Stack(
                children: <Widget>[
                  FlutterLogo(size: 40),
                  Text("AnimatedPhysicalModel"),
                ],
              ),
            ),
            shape: _containerSelected ? BoxShape.rectangle : BoxShape.circle,
            elevation: _containerSelected ? 1 : 6,
            color: _containerSelected ? Colors.blue[100] : Colors.blue[900],
            shadowColor: _containerSelected ? Colors.grey[200] : Colors.grey[800],
            duration: Duration(seconds: 2),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              accentColor: Colors.red,
              textTheme: TextTheme(
                display1: TextStyle(
                  backgroundColor: Colors.red,
                  color: Colors.redAccent,
                  fontSize: 12,
                ),
                display2: TextStyle(
                  backgroundColor: Colors.cyan,
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
            child: InkWell(child: Text("AnimatedTheme")),
//            duration: Duration(seconds: 10),
          ),
          AnimatedCrossFade(
            firstChild: FlutterLogo(
              textColor: Colors.pink,
              size: 40,
            ),
            secondChild: FlutterLogo(
              textColor: Colors.blueGrey,
              size: 40,
            ),
            crossFadeState: _containerSelected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(seconds: 2),
            layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    key: bottomChildKey,
                    left: 0.0,
                    top: 0.0,
                    child: bottomChild,
                  ),
                  Positioned(
                    key: topChildKey,
                    child: topChild,
                  ),
                  Text("AnimatedCrossFade")
                ],
              );
            },
          ),
          Stack(
            children: <Widget>[
              AnimatedSize(
                child: Stack(
                  children: <Widget>[
                    FlutterLogo(
                      size: _containerSelected ? 75 : 20,
                    ),
                    Text("AnimatedSize"),
                  ],
                ),
                duration: Duration(seconds: 2),
                vsync: this,
              )
            ],
          ),
          AnimatedSwitcher(
            duration: Duration(seconds: 2),
            reverseDuration: Duration(seconds: 2),
            child: Column(
              children: <Widget>[
                Text(_containerSelected ? '40' : '04'),
                Text("AnimatedSwitcher"),
              ],
            ),
            key: Key(_containerSelected ? '40' : '04'),
          ),
        ],
      ),
      floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            accentColor: Colors.red,
            textTheme: TextTheme(
              display1: TextStyle(
                backgroundColor: Colors.red,
                color: Colors.redAccent,
                fontSize: 12,
              ),
              display2: TextStyle(
                backgroundColor: Colors.cyan,
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ),
          child: FloatingActionButton(
              child: Icon(Icons.play_arrow),
              onPressed: () {
                setState(() {
                  _containerSelected = !_containerSelected;
                });
              })),
    );
  }
}
