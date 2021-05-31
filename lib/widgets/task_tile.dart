import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget{
  final String name;
  final bool isChecked;
  final Function Callback;
  final Function OnLongPress;

 TaskTile( {
   this.name,
   this.isChecked,
   this.Callback,
   this.OnLongPress
});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: OnLongPress,
      title: Text(name,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Color(0xffff5252),
        onChanged: Callback,
      )
    );
  }
}



