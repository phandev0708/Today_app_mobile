// Khai báo thư viện
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/bloc/todo_bloc.dart';
import 'package:test_app/database/todo_database.dart';
import 'package:test_app/event/delete_todo_event.dart';
import 'package:test_app/models/item.dart';
import 'package:test_app/widgets/card_model_button.dart';

import 'widgets/card_body_widget.dart';

// Hàm main chạy ứng dụng
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instance.init();
  runApp(Provider<TodoBloc>.value(
    value: TodoBloc(),
    child: const MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DataItems> items = [];

  int _currentIndex = 0;

  void _handleAddTask(String content, DateTime date) {
    final item = DataItems(
        id: DateTime.now().toString(), content: content, date: date.toString());
    var newItems = [...items, item];
    newItems.sort((a, b) => a.date.compareTo(b.date));
    setState(() {
      items = newItems;
    });
  }

  // void _handleDeleteTask(String id) {
  //   setState(() {
  //     items.removeWhere((element) => element.id == id);
  //   });
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  final title = [
    const Text('Việc Cần Làm',
        style: TextStyle(color: Colors.white, fontSize: 30)),
    const Text('Việc Sắp Tới',
        style: TextStyle(color: Colors.white, fontSize: 30)),
    const Text('Việc Đã Làm',
        style: TextStyle(color: Colors.white, fontSize: 30))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.deepPurple,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: title[_currentIndex],
          // backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background.jpg'),
                      fit: BoxFit.cover)),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Consumer<TodoBloc>(
                builder: (context, bloc, child) {
                  return StreamBuilder<List<DataItems>>(
                    stream: bloc.todoListStream,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.active:
                          switch (_currentIndex) {
                            case 1:
                              return Column(
                                children: snapshot.data!.map((e) {
                                  var dateTimeParse = DateTime.parse(e.date);
                                  DateTime date1WithoutTime = DateTime(
                                      dateTimeParse.year,
                                      dateTimeParse.month,
                                      dateTimeParse.day);
                                  DateTime date2WithoutTime = DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day + 1);
                                  int comparison = date1WithoutTime
                                      .compareTo(date2WithoutTime);
                                  if (comparison >= 0) {
                                    return CardBody(
                                      index: snapshot.data!.indexOf(e),
                                      item: e,
                                      deleteTask: () {
                                        bloc.event.add(DeleteTodoEvent(e));
                                      },
                                    );
                                  }
                                  return Container();
                                }).toList(),
                              );
                            case 2:
                              return Column(
                                children: snapshot.data!.map((e) {
                                  if (DateTime.parse(e.date)
                                          .compareTo(DateTime.now()) <
                                      0) {
                                    return CardBody(
                                      index: snapshot.data!.indexOf(e),
                                      item: e,
                                      deleteTask: () {
                                        bloc.event.add(DeleteTodoEvent(e));
                                      },
                                    );
                                  }
                                  return Container();
                                }).toList(),
                              );
                            default:
                              return Column(
                                children: snapshot.data!.map((e) {
                                  var dateTimeParse = DateTime.parse(e.date);
                                  DateTime date1WithoutTime = DateTime(
                                      dateTimeParse.year,
                                      dateTimeParse.month,
                                      dateTimeParse.day);
                                  DateTime date2WithoutTime = DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day);
                                  int comparison = date1WithoutTime
                                      .compareTo(date2WithoutTime);
                                  if (comparison == 0 &&
                                      DateTime.parse(e.date)
                                              .compareTo(DateTime.now()) >
                                          0) {
                                    return CardBody(
                                      index: snapshot.data!.indexOf(e),
                                      item: e,
                                      deleteTask: () {
                                        bloc.event.add(DeleteTodoEvent(e));
                                      },
                                    );
                                  }
                                  return Container();
                                }).toList(),
                              );
                          }
                        case ConnectionState.waiting:
                          return const Center(
                            child: SizedBox(
                              width: 200,
                              height: 100,
                              child: Text(
                                'Chưa có dữ liệu',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          );
                        case ConnectionState.none:
                        default:
                          return const Center(
                            child: SizedBox(
                              width: 70,
                              height: 70,
                              child: CircularProgressIndicator(),
                            ),
                          );
                      }
                    },
                  );
                },
              ),
            )
          ],
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
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Colors.blue,
          animationDuration: Duration(milliseconds: 300),
          items: const [
            Icon(
              Icons.date_range_outlined,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              // Icons.calendar_today_outlined,
              Icons.next_week,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.done_all_outlined,
              size: 30,
              color: Colors.white,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
