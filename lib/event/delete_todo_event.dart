import 'package:test_app/base/base_event.dart';
import 'package:test_app/models/item.dart';

class DeleteTodoEvent extends BaseEvent {
  DataItems task;

  DeleteTodoEvent(this.task);
}
