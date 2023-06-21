// Khai báo thư viện
import 'package:flutter/material.dart';
import 'package:test_app/models/item.dart';
import 'package:test_app/widgets/card_model_button.dart';

import 'widgets/card_body_widget.dart';

// Hàm main chạy ứng dụng
void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DataItems> items = [];

  void _handleAddTask(String name, DateTime date) {
    final item =
        DataItems(id: DateTime.now().toString(), name: name, date: date);
    var newItems = [...items, item];
    newItems.sort((a, b) => a.date.compareTo(b.date));
    setState(() {
      items = newItems;
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Việc cần làm',
              style: TextStyle(color: Colors.white, fontSize: 30)),
          // backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: items
                .map((e) => CardBody(
                      index: items.indexOf(e),
                      item: e,
                      deleteTask: _handleDeleteTask,
                    ))
                .toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return ModelButton(addTask: _handleAddTask);
                });
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ));
  }
}
