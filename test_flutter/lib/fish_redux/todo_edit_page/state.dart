import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/state.dart';

//可以认为是一个数据bean
class TodoEditState implements Cloneable<TodoEditState> {
  ToDoState toDo;

  TextEditingController nameEditController;
  TextEditingController descEditController;

  FocusNode focusNodeName;
  FocusNode focusNodeDesc;

  @override
  TodoEditState clone() {
    return TodoEditState()
      ..nameEditController = nameEditController
      ..descEditController = descEditController
      ..focusNodeName = focusNodeName
      ..focusNodeDesc = focusNodeDesc
      ..toDo = toDo;
  }
}

TodoEditState initState(ToDoState arg) {
  final TodoEditState state = TodoEditState();
  state.toDo = arg?.clone() ?? ToDoState();
  state.nameEditController = TextEditingController(text: arg?.title);
  state.descEditController = TextEditingController(text: arg?.desc);
  state.focusNodeName = FocusNode();
  state.focusNodeDesc = FocusNode();
  return state;
}
