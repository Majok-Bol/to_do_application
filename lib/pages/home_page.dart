import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage>{
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
    );

  }
}