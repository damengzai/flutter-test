import 'package:fish_redux/fish_redux.dart';

enum CounterAction { add, onAdd }

class CounterActionCreator {
  //reducer使用
  static Action add() {
    return const Action(CounterAction.add);
  }
  //effect使用
  static Action onAdd() {
    return const Action(CounterAction.onAdd);
  }
}
