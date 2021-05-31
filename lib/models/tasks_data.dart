import 'package:flutter/foundation.dart';
import 'tasks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:listey/database_helper.dart';


class TaskData extends ChangeNotifier{
  static DatabaseHelper _databaseHelper = new DatabaseHelper();


  List<Tasks> tasks= [];






void addTask(String newTask) {
  final task = Tasks(title:newTask);
  tasks.add(task);
  notifyListeners();
  _databaseHelper.insertTodo(task);


}
void updateTasks(Tasks Task){
  Task.toggleDone();
  notifyListeners();
  _databaseHelper.updateTodo(Task);
}
void deleteTasks(Tasks Task){
  tasks.remove(Task);
  notifyListeners();
  _databaseHelper.deleteTodo(Task);

}
}
