//提出Consumer来，目的是简化ChangeNotifierProvider.of的使用，封装起来，使用更简便,同时语义明确
import 'package:flutter/widgets.dart';
import 'package:test_flutter/provider/lib/ChangeNotifierProvider.dart';

class Consumer<T> extends StatelessWidget {
  Consumer({Key key, @required this.builder, this.child})
      : assert(builder != null),
        super(key: key);

  final Widget child;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of(context),
    );
  }
}
