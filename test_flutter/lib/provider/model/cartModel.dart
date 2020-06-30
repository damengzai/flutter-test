import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:test_flutter/provider/model/item.dart';

class CartModel extends ChangeNotifier{
  // 保存购物车中商品列表
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  double get totalPrice => _items.fold(0, (previousValue, element) => previousValue + element.count * element.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}