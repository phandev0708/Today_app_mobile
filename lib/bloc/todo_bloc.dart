import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/base/base_bloc.dart';
import 'package:test_app/base/base_event.dart';
import 'package:test_app/database/todo_table.dart';

import 'package:test_app/event/add_todo_event.dart';
import 'package:test_app/event/delete_todo_event.dart';
import 'package:test_app/models/item.dart';
import 'package:uuid/uuid.dart';

class TodoBloc extends BaseBloc {
  TodoTable todoTable = TodoTable();

  final StreamController<List<DataItems>> _todoController =
      StreamController<List<DataItems>>();

  Stream<List<DataItems>> get todoListStream => _todoController.stream;
  List<DataItems> _todoListData = List<DataItems>.empty(growable: true);

  initData() async {
    _todoListData = await todoTable.selectAllTodo();
    if (_todoListData == null) return;
    _todoController.sink.add(_todoListData);
  }

  _handleAddTask(DataItems item) async {
    // insert to database
    await todoTable.insertTodo(item);

    _todoListData.add(item);
    _todoController.sink.add(_todoListData);
  }

  _handleDeleteTask(DataItems item) async {
    // delete from database
    await todoTable.deleteTodo(item);

    _todoListData.remove(item);
    _todoController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    // TODO: implement dispatchEvent
    if (event is AddTodoEvent) {
      DataItems item = DataItems(
          id: const Uuid().v4(),
          content: event.content,
          date: event.date.toString());
      _handleAddTask(item);
    } else if (event is DeleteTodoEvent) {
      _handleDeleteTask(event.task);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _todoController.close();
  }
}

class MyNotifier with ChangeNotifier {
  MyNotifier() {
    _fetchSomething();
  }

  Future<void> _fetchSomething() async {}
}
