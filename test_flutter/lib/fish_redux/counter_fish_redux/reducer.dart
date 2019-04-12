import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/action.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/state.dart';

Reducer<CounterState> buildReducer() {
  return asReducer<CounterState>(<Object, Reducer<CounterState>>{
    CounterAction.add: _add,
  });
}

CounterState _add(CounterState state, Action action) {
  final CounterState newState = state.clone();
  newState.count = ++state.count;
  return newState;
}
