import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget{
  ToDoTile({super.key,required this.taskName,required this.taskCompleted,required this.onChanged,required this.deleteFunction});
  final String taskName;
  final bool taskCompleted;
  Function(bool?)?onChanged;
  Function(BuildContext)?deleteFunction;
  @override
  Widget build(BuildContext context){
    return Padding(

      padding: EdgeInsets.only(left:2,right: 25,top: 25),
        child:Slidable(
          endActionPane: ActionPane(
              motion:StretchMotion(), children:[
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              
              onPressed: deleteFunction,icon: Icons.delete,backgroundColor: Colors.red,),
          ]),
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
    ),),);

  }
}