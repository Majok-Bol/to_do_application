import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList=[];
  //reference the box
  final _mybox=Hive.box('mybox');
  //run this if this is the first time opening this app
  void createInitialData(){
    toDoList=[
      ['Make a video',false],
      ['Go to gym',false],
    ];

  }
  //load the data from the database
void loadDataFromDatabase(){
    toDoList=_mybox.get('toDoList');

}
//update the database
void updateTheDatabase(){
    _mybox.put('toDoList', toDoList);

}

}