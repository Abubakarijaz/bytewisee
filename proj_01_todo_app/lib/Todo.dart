import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'Todo.g.dart';//build_runner build k bad ye file auto geneate hogi
//then typeadapter reg krna ha main me,above the opening box


@HiveType(typeId: 1)
class Todo{
  @HiveField(0)
  late String title;
  @HiveField(1)
  late bool isCompleted;
  Todo({
    required this.title,
    required this.isCompleted

});


}