import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/provider/lib/ChangeNotifierProvider.dart';
import 'package:test_flutter/provider/model/Consumer.dart';
import 'package:test_flutter/provider/model/cartModel.dart';
import 'package:test_flutter/provider/model/item.dart';

class ProviderRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProviderRouteState();
  }
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ChangeNotifierProvider<CartModel>(
            data: CartModel(),
            child: Builder(
              builder: (context) {
                return Column(
                  children: <Widget>[
//                Builder(builder: (context) {
                    // 有ChangeNotifierProvider.of 即建立了依赖
//                  var cart = ChangeNotifierProvider.of<CartModel>(context);
//                  return Text('总价：${cart.totalPrice}');
//                }),
                    //简化
                    Consumer<CartModel>(
                      builder: (context, cart) => Text("总价：${cart.totalPrice}"),
                    ),
                    Builder(
                      builder: (context) {
                        return RaisedButton(
                            child: Text('添加商品'),
                            onPressed: () {
                              // 有ChangeNotifierProvider.of 即建立了依赖
                              ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(10, 1));
                            });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
