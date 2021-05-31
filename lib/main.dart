import 'package:flutter/material.dart';
import 'package:listey/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:listey/models/tasks_data.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder:(context) => TaskData(),
      child:  MaterialApp(
      home: TasksScreen(),

      debugShowCheckedModeBanner: false,
    ));
  }
}
