import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/effect.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/reducer.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/state.dart';
import 'view.dart';

class ToDoComponent extends Component<ToDoState> {
  ToDoComponent()
      : super(
          view: buildView,
          effect: buildEffect(),
          reducer: buildReducer(),
        );
}
