import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/action.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/state.dart';
///Effect
Effect<CounterState> buildEffect() {
  return combineEffects(<Object, Effect<CounterState>>{
    CounterAction.onAdd: _onAdd,
  });
}

void _onAdd(Action action, Context<CounterState> ctx) {
  print("_onAdd");
  ctx.dispatch(CounterActionCreator.add());
}
