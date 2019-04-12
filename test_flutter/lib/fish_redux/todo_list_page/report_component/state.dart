import 'package:fish_redux/fish_redux.dart';

class ReportState implements Cloneable<ReportState> {
  int total;
  int done;

  ReportState({this.total, this.done});

  @override
  ReportState clone() {
    return ReportState()
      ..total = total
      ..done = done;
  }

  @override
  String toString() {
    return "ReportState{total: $total, done: $done}";
  }
}
