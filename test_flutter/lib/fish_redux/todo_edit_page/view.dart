import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/fish_redux/todo_edit_page/action.dart';
import 'package:test_flutter/fish_redux/todo_edit_page/state.dart';

Widget buildView(
    TodoEditState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Todo'),
    ),
    body: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  child: const Text(
                    'title',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  width: 56,
                  alignment: AlignmentDirectional.topEnd,
                ),
                Expanded(
                  child: Container(
                    color: const Color(0xFFE0E0E0),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(left: 8),
                    child: EditableText(
                      autofocus: true,
                      controller: state.nameEditController,
                      focusNode: state.focusNodeName,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      cursorColor: Colors.yellow,
                      backgroundCursorColor: const Color(0xFFFFF59D),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 32),
              alignment: AlignmentDirectional.topStart,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: const Text(
                      'desc:',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    width: 56,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFE0E0E0),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(left: 8),
                      child: EditableText(
                          controller: state.descEditController,
                          focusNode: state.focusNodeDesc,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.yellow,
                          backgroundCursorColor: const Color(0xFFE0E0E0)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => dispatch(ToDoEditActionCreator.done()),
      tooltip: "Done",
      child: const Icon(Icons.done),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  );
}
