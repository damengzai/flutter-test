import 'package:flutter/material.dart';

class AnimatedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AnimatedListPage();
  }
}

class _AnimatedListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedListState();
  }
}

class _AnimatedListState extends State<_AnimatedListPage> {
  List<String> _itemList;
  String _selectedItem;
  int _nextItem;
  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    _itemList = List.generate(4, (index) => '$index');
    _nextItem = 4;
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return _buildItemView(context, _itemList[index], animation);
  }

  Widget _buildItemView(BuildContext context, String item, Animation<double> animation) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: GestureDetector(
          onTap: () => _onItemTap(item),
          child: SizedBox(
            height: 120,
            child: Card(
              color: Colors.red,
              child: Center(
                child: Text(
                  '$item',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onItemTap(String item) {
    _selectedItem = item;
  }

  _addItem() {
    int _length = _itemList.length;
    final int _curIndex = _selectedItem == null ? _length : _itemList.indexOf(_selectedItem);
    _itemList.insert(_curIndex, '${_nextItem++}');
    _listKey.currentState.insertItem(_curIndex);
  }

  _delItem() {
    int _length = _itemList.length;
    final int _curIndex = _selectedItem == null ? _length : _itemList.indexOf(_selectedItem);
    String curItem = _itemList.removeAt(_curIndex);
    _listKey.currentState.removeItem(_curIndex, (BuildContext context, Animation<double> animation) {
      return _buildItemView(context, curItem, animation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addItem,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _delItem,
          )
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        itemBuilder: _buildItem,
        initialItemCount: _itemList.length,
      ),
    );
  }
}
