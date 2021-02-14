import 'package:flutter/cupertino.dart';

class Item {
  List<Item> items;
  String note;
  DateTime timeToComplete;
  bool completed;
  String repeats;
  String dealine; //DateTime later
  List<DateTime> reminders;
  String classId;
  String title;
  Color color;

  Item(this.completed, this.dealine, this.classId, this.title, this.color);
}
