import 'package:flutter/material.dart';
import 'package:to_do_application/utils/todo_tile.dart';
class HomePage extends StatefulWidget {
 const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
  final List toDoList=[
    ["Make tutorial",false],
    ["Go to gym",false],

  ];
  void checkBoxChanged(bool?value,int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });

  }
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.yellow.shade200,
    appBar: AppBar(
    title: Text('To Do'),
      centerTitle: true,
      backgroundColor: Colors.yellow.shade400,
      elevation: 0,

    ),
      body:ListView.builder(
        itemCount:toDoList.length ,
          itemBuilder: (context,index){
          return ToDoTile(taskName:toDoList[index][0], taskCompleted: toDoList[index][1], onChanged:(value) {
            checkBoxChanged(value,index);

          },);

      })
    );

  }
}