import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/fish_redux/todo_list_page/action.dart';
import 'package:test_flutter/fish_redux/todo_list_page/state.dart';

Widget buildView(PageState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      title: const Text("ToDoList"),
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          viewService.buildComponent("report"),
          Expanded(
              child: ListView.builder(
            itemBuilder: adapter.itemBuilder,
            itemCount: adapter.itemCount,
          ))
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(PageActionCreator.onAddAction()),
      tooltip: "Add",
      child: const Icon(Icons.add),
    ),
  );
}
