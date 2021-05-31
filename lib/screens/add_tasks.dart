import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:listey/models/tasks_data.dart';
class AddTasks extends StatelessWidget {
  String newTask;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:Container(
      color: Color(0xff757575),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child:  Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0) ,topRight:Radius.circular(20.0) ),
          color: Colors.white,
          
        ),
          child:Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Add Task',style:TextStyle(fontSize: 30.0,color: Colors.redAccent,fontWeight:FontWeight.bold,),
                  textAlign: TextAlign.center,),
                TextField(
                  onChanged: (nTask){
                    newTask=nTask;
                  },
                  autofocus: true,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.redAccent,
                 decoration: InputDecoration(
                   enabledBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color: Colors.redAccent),),
                     focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
                   border: UnderlineInputBorder(
                     borderSide: BorderSide(color: Colors.redAccent),
                   )
                   )
                 ),


                Padding(padding: EdgeInsets.only(top: 20.0),child:FlatButton(color: Colors.redAccent,
                onPressed: (){
                  if(newTask==null){ Navigator.pop(context);}
                  else{
                  Provider.of<TaskData>(context).addTask(newTask);
                  Navigator.pop(context);}
                }, child: Text('Add',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
                    fontSize: 20.0),
                    )))
              ],
          )
      ),
    ));
  }
}
