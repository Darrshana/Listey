import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listey/screens/add_tasks.dart';

class TasksScreen extends StatelessWidget {
  Widget BottomSheet(BuildContext context){
    return AddTasks();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),backgroundColor: Colors.redAccent,onPressed: ()
        {
          showModalBottomSheet(context: context, builder: BottomSheet);
        },),
      backgroundColor: Colors.redAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children:[Container(
        padding: EdgeInsets.only(top:60.0,left: 30.0,right:30.0,bottom: 30.0),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [CircleAvatar(child:Icon(Icons.list_rounded,size: 40.0,color: Colors.redAccent,),
          backgroundColor: Colors.white,
          radius: 35,
        ),
        SizedBox(height: 15.0,),
        Text('Listey',style: TextStyle(color: Colors.white,fontSize: 45.0,fontWeight: FontWeight.w700),),
      
        Text('2 tasks',style: TextStyle(fontSize: 18.0,color: Colors.white),),])
    ),
        Expanded(child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
            color: Colors.white
          ),
          child: ListView(
            children: [
              TaskTile(),
              TaskTile(),
              TaskTile(),

            ],
          ),
        ))
      
      
      ])));
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Task 1'),
      trailing: Checkbox(
        value: true,
        focusColor: Color(0xffff5252),


      ),
    );
  }
}
