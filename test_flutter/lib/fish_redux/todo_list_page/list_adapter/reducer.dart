import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/todo_list_page/list_adapter/action.dart';
import 'package:test_flutter/fish_redux/todo_list_page/state.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/action.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/state.dart';

Reducer<PageState> buildReducer() {
  return asReducer(<Object, Reducer<PageState>>{
    ToDoListAction.add: _add,
    ToDoAction.remove: _remove,
  });
}

PageState _add(PageState state, Action action) {
  final ToDoState toDo = action.payload;
  final PageState newState = state.clone();
  newState.toDos.add(toDo);
  return newState;
}

PageState _remove(PageState state, Action action) {
  final String unique = action.payload;
  final PageState newState = state.clone();
  newState.toDos.removeWhere((ToDoState state) => state.uniqueId == unique);
  return newState;
}