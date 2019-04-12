import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/todo_list_page/report_component/state.dart';
import 'package:test_flutter/fish_redux/todo_list_page/todo_component/state.dart';

class PageState implements Cloneable<PageState> {
  List<ToDoState> toDos;

  @override
  PageState clone() {
    return PageState()..toDos = toDos;
  }
}

PageState initState(Map<String, dynamic> args) {
  //just demo do nothing
  return PageState();
}

class ReportConnector extends ConnOp<PageState, ReportState> {
  @override
  ReportState get(PageState state) {
    final ReportState reportState = new ReportState();
    reportState.total = state.toDos.length;
    reportState.done =
        state.toDos.where((ToDoState tds) => tds.isDone).toList().length;
    return reportState;
  }

  @override
  void set(PageState state, ReportState subState) {}
}
