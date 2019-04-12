import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/effect.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/reducer.dart';
import 'package:test_flutter/fish_redux/counter_fish_redux/state.dart';
import 'state.dart';
import 'view.dart';

class CounterFishReduxPage extends Page<CounterState, Map<String, dynamic>> {
  CounterFishReduxPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
        );
}
