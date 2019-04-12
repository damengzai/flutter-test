import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/fish_redux/todo_list_page/report_component/state.dart';

Widget buildView(
    ReportState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    color: Colors.blue,
    child: Row(
      children: <Widget>[
        Container(
          child: const Icon(Icons.report),
          margin: const EdgeInsets.only(right: 8),
        ),
        Text(
          "Total ${state.total} tasks, ${state.done} done",
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    ),
  );
}
