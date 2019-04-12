import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/todo_list_page/report_component/state.dart';
import 'view.dart';

class ReportComponent extends Component<ReportState> {
  ReportComponent()
      : super(
          view: buildView,
        );
}
