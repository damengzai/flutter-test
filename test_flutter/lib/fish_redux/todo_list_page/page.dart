import 'package:fish_redux/fish_redux.dart';
import 'package:test_flutter/fish_redux/todo_list_page/effect.dart';
import 'package:test_flutter/fish_redux/todo_list_page/list_adapter/adapter.dart';
import 'package:test_flutter/fish_redux/todo_list_page/reducer.dart';
import 'package:test_flutter/fish_redux/todo_list_page/report_component/component.dart';
import 'package:test_flutter/fish_redux/todo_list_page/view.dart';
import 'state.dart';

class TodoListPage extends Page<PageState, Map<String, dynamic>> {
  TodoListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PageState>(
            adapter: ToDoListAdapter(),
            slots: <String, Dependent<PageState>>{
              'report': ReportConnector() + ReportComponent()
            },
          ),
          middleware: <Middleware<PageState>>[
            logMiddleware(tag: 'ToDoListPage'),
          ],
        );
}
