import 'package:flutter/material.dart';
import 'package:to_do_application/data/database.dart';
import 'package:to_do_application/utils/dialog_box.dart';
import 'package:to_do_application/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
  //reference box
  final _mybox=Hive.box('mybox');

  //create instance of database
  ToDoDatabase db=ToDoDatabase();
  //if this is the first time opening the app
  //no data in the database
  @override void initState() {
    // TODO: implement initState

if(_mybox.get('toDoList')==null){
  db.createInitialData();
  //else check if there is already data in the database
}else{
  db.loadDataFromDatabase();

}
    super.initState();
  }
  final _controller=TextEditingController();
  // final List toDoList=[
  //
  // ];
  void checkBoxChanged(bool?value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateTheDatabase();

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
  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);

    });
    db.updateTheDatabase();
  }
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateTheDatabase();
  }
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
    appBar: AppBar(
    title: Text('To Do'),
      centerTitle: true,
      backgroundColor: Colors.blue.shade200,
      elevation: 0,

    ),
      floatingActionButton: FloatingActionButton(backgroundColor:Colors.green,onPressed:createNewTask,child: Icon(Icons.add,size: 33,)),
      body:ListView.builder(
        itemCount:db.toDoList.length ,
          itemBuilder: (context,index){
          return ToDoTile(taskName:db.toDoList[index][0], taskCompleted: db.toDoList[index][1], onChanged:(value)=>
            checkBoxChanged(value,index),deleteFunction: (context)=>deleteTask(index),
            );

      })
    );

  }
}