import 'package:fish_redux/fish_redux.dart';

//定义有哪些相关的操作
enum ToDoEditAction { update, done }

class ToDoEditActionCreator {
  static Action update(String name, String desc) {
    return Action(
      ToDoEditAction.update,
      payload: <String, String>{'name': name, 'desc': desc},
    );
  }

  static Action done() {
    return const Action(ToDoEditAction.done);
  }
}
