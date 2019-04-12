import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/action.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/state.dart';

Effect<ToDoState> buildEffect() {
  return combineEffects(<Object, Effect<ToDoState>>{
    ToDoAction.onEdit: _onEdit,
    ToDoAction.onRemove: _onRemove,
  });
}

void _onEdit(Action action, Context<ToDoState> ctx) {
  if (action.payload == ctx.state.uniqueId) {
    Navigator.of(ctx.context)
        .pushNamed('todo_edit', arguments: ctx.state)
        .then((dynamic toDo) {
      if (toDo != null) {
        ctx.dispatch(ToDoActionCreator.editAction(toDo));
      }
    });
  }
}

void _onRemove(Action action, Context<ToDoState> ctx) async {
  final String select = await showDialog(
      context: ctx.context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text("Are you sure to delete${ctx.state.title} ?"),
          actions: <Widget>[
            GestureDetector(
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => Navigator.of(buildContext).pop(),
            ),
            GestureDetector(
              child: const Text('Yes', style: TextStyle(fontSize: 16)),
              onTap: () => Navigator.of(buildContext).pop('Yes'),
            )
          ],
        );
      });
  if (select == 'Yes') {
    ctx.dispatch(ToDoActionCreator.removeAction(ctx.state.uniqueId));
  }
}
