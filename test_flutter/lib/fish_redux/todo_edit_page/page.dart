import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/todo_edit_page/effect.dart';
import 'package:test_flutter/fish_redux/todo_edit_page/reducer.dart';
import 'package:test_flutter/fish_redux/todo_edit_page/state.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/state.dart';
import 'view.dart';

class TodoEditPage extends Page<TodoEditState, ToDoState> {
  TodoEditPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          middleware: <Middleware<TodoEditState>>[
            logMiddleware(tag: 'TodoEditPage')
          ],
        );
}
