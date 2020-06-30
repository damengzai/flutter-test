import 'package:flutter/material.dart';
import 'package:test_flutter/provider/lib/InheritedProvider.dart';

Type _typeOf<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;

  // 方便子树中的widget获取共享数据
  static T of<T>(BuildContext context, {bool listen = true}) {
    final type = _typeOf<InheritedProvider<T>>();
    // TODO 使用 dependOnInheritedWidgetOfExactType
    final provider = listen
        ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T> // 注册依赖关系
        : context.ancestorInheritedElementForWidgetOfExactType(type)?.widget as InheritedProvider<T>; // 不注册依赖关系，防止不需要更新的组件也被更新了，如事件的发出者（生产者）
    // 获取共享的数据，存在InheritedProvider中共享的数据
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  void update() {
    // 如果数据变化（module类调用了notifyListener），重新构建构建InheritedProvider
    // TODO 使用 setState(() {});
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
