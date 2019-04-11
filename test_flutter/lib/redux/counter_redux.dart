import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

//定义action
enum Actions { Increment }

//处理不同的action
int countReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }
  return state;
}

void main() {
  final store = new Store(countReducer, initialState: 0);
  runApp(MyApp(
    store: store,
    title: 'redux',
  ));
}

class MyApp extends StatelessWidget {
  final Store<int> store;
  final String title;

  MyApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //将MaterialApp用StoreProvider包裹，确保所有的router都到store
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new StoreConnector<int, String>(
                  builder: (context, count) {
                    return Text(
                      count,
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                  converter: (store) => store.state.toString(),
                ),
              ],
            ),
          ),
          //绑定Action
          floatingActionButton: new StoreConnector<int, VoidCallback>(
              builder: (context, callback) {
            return FloatingActionButton(
              onPressed: callback,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }, converter: (store) {
            return () => store.dispatch(Actions.Increment);
          }),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
