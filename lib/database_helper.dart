import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:listey/models/tasks_data.dart';
import 'package:listey/models/tasks.dart';
import 'package:provider/provider.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String todoTable = 'todo_table';
  String colTitle = 'title';
  String colDone ='isDone';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'todos.db';

    // Open/create the database at a given path
    var todosDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $todoTable($colTitle TEXT, '
        '$colDone bool)');
  }

  // Fetch Operation: Get all todo objects from database
  Future<List<Map<String, dynamic>>> getTodoMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $todoTable order by $colTitle ASC');
    var result = await db.query(todoTable);
    return result;
  }

  // Insert Operation: Insert a todo object to database
  insertTodo(Tasks todo) async {
    Database db = await this.database;
    var result = await db.insert(todoTable, todo.toMap());

  }

  // Update Operation: Update a todo object and save it to database
  updateTodo(Tasks todo) async {
    var db = await this.database;
    var result = await db.update(todoTable, todo.toMap(), where: '$colTitle = ?', whereArgs: [todo.title]);

  }


  // Delete Operation: Delete a todo object from database
   deleteTodo(Tasks todo) async {
    var db = await this.database;
    var result = await db.delete(todoTable, where: '$colTitle = ?', whereArgs: [todo.title]);

  }

  // Get number of todo objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $todoTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
  Future<List<Tasks>> getTodoList() async {

    var todoMapList = await getTodoMapList(); // Get 'Map List' from database
    int count = todoMapList.length;         // Count the number of map entries in db table

    List<Tasks> todoList = List<Tasks>();
    // For loop to create a 'todo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      todoList.add(Tasks.fromMapObject(todoMapList[i]));
    }

    return todoList;
  }

}
