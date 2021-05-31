import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:listey/screens/add_tasks.dart';
import 'package:listey/models/tasks_data.dart';
import 'package:listey/widgets/task_tile.dart';
import 'package:get_storage/get_storage.dart';
import 'package:listey/models/tasks.dart';
import 'package:listey/database_helper.dart';




class TasksScreen extends StatelessWidget {
  static DatabaseHelper _databaseHelper = new DatabaseHelper();
  Widget BottomSheet(BuildContext context) {
    return AddTasks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<List<Tasks>>(
            future: _databaseHelper.getTodoList(),
            builder:  (context, snapshot) {
              if (snapshot.hasData) {
                Provider.of<TaskData>(context).tasks=snapshot.data;
                return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.redAccent,
              onPressed: () {
                showModalBottomSheet(context: context, builder: BottomSheet);
              },
            ),
            backgroundColor: Colors.redAccent,
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: EdgeInsets.only(
                      top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.list_rounded,
                            size: 40.0,
                            color: Colors.redAccent,
                          ),
                          backgroundColor: Colors.white,
                          radius: 35,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Listey',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45.0,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '${Provider.of<TaskData>(context).tasks.length} tasks',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ])),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    color: Colors.white),
                child:  ListView.builder(
                             itemBuilder: (context,index) {

                             final task = Provider.of<TaskData>(context).tasks[index];

                             return TaskTile(name : task.title , isChecked: task.isDone,
                                 Callback: (checkboxstate) {Provider.of<TaskData>(context).updateTasks(task);},
                            OnLongPress: () {Provider.of<TaskData>(context).deleteTasks(task);}

                           );



                  },
                itemCount: Provider.of<TaskData>(context).tasks.length,)))]));}

            return CircularProgressIndicator();
            }));

}}



