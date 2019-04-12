import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/fish_redux/todo_list_page/action.dart';
import 'package:test_flutter/fish_redux/todo_list_page/state.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/state.dart';

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
  });
}

void _init(Action action, Context<PageState> ctx) {
  final List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
        uniqueId: "0", title: "Learn Fish Redux", desc: "State", isDone: false),
    ToDoState(
        uniqueId: "1",
        title: "Learn Fish Redux",
        desc: "effect",
        isDone: false),
    ToDoState(
        uniqueId: "2",
        title: "Learn Fish Redux",
        desc: "Action",
        isDone: false),
  ];
  ctx.dispatch(PageActionCreator.initToDosAction(initToDos));
}

//void onAdd(Action action, Context<PageState> ctx) {
//  Navigator.of(ctx.context)
//      .pushNamed("todo_edit", arguments: null)
//      .then((dynamic toDo) {
//    if (toDo != null &&
//        (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)) {
////      ctx.dispatch()
//    }
//  });
//}
