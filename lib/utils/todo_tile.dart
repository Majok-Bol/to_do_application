import 'package:flutter/material.dart';
class ToDoTile extends StatelessWidget{
  ToDoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChanged});
  final String taskName;
  final bool taskCompleted;
  Function(bool?)?onChanged;
  @override
  Widget build(BuildContext context){
    return Padding(

      padding: EdgeInsets.only(left:2,right: 25,top: 25),
        child:Container(
          padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.yellow.shade500,
        borderRadius: BorderRadius.circular(12)
      ),
      child:Row(
          children: [
            Checkbox(value: taskCompleted, onChanged: onChanged,activeColor:Colors.black,),
            //task name
            Text(taskName,style: TextStyle(decoration:taskCompleted?TextDecoration.lineThrough:TextDecoration.none),),
          ]),
    ),);

  }
}