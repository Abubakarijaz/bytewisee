import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
          child: ElevatedButton(
              child: Text("Go Back"), //go back button
              onPressed: (){
                Navigator.pop(context);
              }
          )
      ),
    );
  }
}