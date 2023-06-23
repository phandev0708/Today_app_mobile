import 'package:test_app/base/base_event.dart';

class AddTodoEvent extends BaseEvent {
  String content;
  DateTime date;

  AddTodoEvent(this.content, this.date);
}
