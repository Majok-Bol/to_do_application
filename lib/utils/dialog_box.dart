import 'package:flutter/material.dart';
class DialogBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.yellow.shade200,
      content: Container(
        padding: EdgeInsets.all(10),
        height: 120,
        child: Column(
          children: [
            //get user input
            TextField(
              decoration:InputDecoration(
                border: OutlineInputBorder(),
              )


            ),
            //save and cancel buttons

          ],
        ),
      ),
    );
  }
}