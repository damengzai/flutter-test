import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/state.dart';

enum ToDoAction { onEdit, edit, done, onRemove, remove }

class ToDoActionCreator {
  static Action onEditAction(String uniqueId) {
    return Action(ToDoAction.onEdit, payload: uniqueId);
  }

  //effect使用
  static Action editAction(ToDoState toDo) {
    return Action(ToDoAction.edit, payload: toDo);
  }

  static Action doneAction(String uniqueId) {
    return Action(ToDoAction.done, payload: uniqueId);
  }

  static Action onRemoveAction(String uniqueId) {
    return Action(ToDoAction.onRemove, payload: uniqueId);
  }

  //effect使用
  static Action removeAction(String uniqueId) {
    return Action(ToDoAction.remove, payload: uniqueId);
  }
}
