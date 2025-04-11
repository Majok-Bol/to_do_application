import 'package:flutter/material.dart';
import 'package:to_do_application/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  await Hive.initFlutter();
  //open box
  var box=await Hive.openBox('mybox');
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),

    );
  }
}