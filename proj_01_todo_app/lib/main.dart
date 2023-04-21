

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'Home.dart';
import 'Todo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory=await getApplicationDocumentsDirectory();//local storage in phone
  Hive.init(directory.path);
  Hive.registerAdapter(TodoAdapter()); // adapter ,'tod0.g.dart ' file bnany k bad add krna jo k build runner build sy bnti..
  await Hive.openBox<Todo>('todo');//Tod0 type ka box(DB) tod0 open kia ha..
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To DO App',
      home: HomeScreen()
    );
  }
}
