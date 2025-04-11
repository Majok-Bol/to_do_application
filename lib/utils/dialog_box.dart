import 'package:flutter/material.dart';
import 'package:to_do_application/utils/my_buttons.dart';
class DialogBox extends StatelessWidget{
  final myController;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key,required this.myController,required this.onSave,required this.onCancel});
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.blue.shade50,
      content: Container(
        padding: EdgeInsets.all(10),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: myController,
              decoration:InputDecoration(
                hintText: 'Add a new task',
                border: OutlineInputBorder(),
              )


            ),
            Row(
              children: [
                MyButton(text: 'Save', onPressed:onSave,),
                SizedBox(width: 20,),
                MyButton(text: 'Cancel', onPressed:onCancel,),
              ],
            )
            //save and cancel buttons

          ],
        ),
      ),
    );
  }
}