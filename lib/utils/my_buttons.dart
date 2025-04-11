import 'package:flutter/material.dart';
class MyButton extends StatelessWidget{
  MyButton({super.key,required this.text,required this.onPressed});
  final String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context){
    return MaterialButton(
      color:Colors.yellow.shade100,
        onPressed: onPressed,
        child: Text(text));
  }

}