import 'package:flutter/material.dart';
import 'package:to_do_application/utils/dialog_box.dart';
import 'package:to_do_application/utils/todo_tile.dart';
class HomePage extends StatefulWidget {
 const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
  final _controller=TextEditingController();
  final List toDoList=[
    ["Make tutorial",false],
    ["Go to gym",false],

  ];
  void checkBoxChanged(bool?value,int index){
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });

  }
  //create new task
  void createNewTask(){
    setState(() {
      showDialog(context: context, builder: (context){
        return DialogBox(
          myController:_controller,
          onSave: saveNewTask,
          onCancel:()=> Navigator.of(context).pop(),
        );
      });


    });
  }
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text,false]);
    });
    Navigator.of(context).pop();
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
      floatingActionButton: FloatingActionButton(onPressed:createNewTask,child: Icon(Icons.add),),
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