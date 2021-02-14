import 'package:flutter/material.dart';
import 'package:flutterproj/main.dart';
import 'package:flutterproj/widgets/new_assignment_widget.dart';
import 'dart:convert';

class AssignmentsPage extends StatefulWidget {
  @override
  _AssignmentsPageState createState() => _AssignmentsPageState();
}

class _AssignmentsPageState extends State<AssignmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: ListView(
        padding: EdgeInsets.only(top: 50),
        children: getList(),
      ),
    );
  }

  List<Widget> getList() {
    List<NewAssinment> list = [];
    List dataDates = [
      "DATE: 2020-02-10 11:59:59 PM \nEECS 1022: TEST \nSTATE: OVERDUE!",
      "DATE: 2020-02-13 11:59:59 PM \nEECS 1022: TEST \nSTATE: DUE TODAY!",
      "DATE: 2020-02-14 11:59:59 PM \nMATH 1300: TEST \nSTATE: UPCOMING",
      "DATE: 2020-02-15 11:59:59 PM \nPHYS 1412: LAB04 \nSTATE: UPCOMING",
      "DATE: 2020-02-08 11:59:59 PM \nEECS 1022: LAB04 \nSTATE: OVERDUE!",
      "DATE: 2020-02-22 11:59:59 PM \nEECS 1022: LAB05 \nSTATE: UPCOMING",
      "DATE: 2020-02-13 11:59:59 PM \nEECS 1022: TUTORIAL \nSTATE: DUE TODAY!",
      "DATE: 2020-02-09 11:59:59 PM \nMATH 1310: ASSIGNMENT05 \nSTATE: OVERDUE!",
      "DATE: 2020-02-28 11:59:59 PM \nMATH 1310: ASSIGNMENT06 \nSTATE: UPCOMING",
      "DATE: 2020-02-17 11:59:59 PM \nEECS 1001: QUIZ \nSTATE: UPCOMING!",
    ];

    dataDates.sort((a, b) => a.compareTo(b));

    for (int i = 0; i < 5; i++) {
      print(dataDates[i]);
    }

    for (int i = 0; i < dataDates.length; i++) {
      if (dataDates[i].contains("OVERDUE!")) {
        list.add(NewAssinment(
          title: dataDates[i],
          color: Colors.red,
        ));
      } else if (dataDates[i].contains("TODAY!")) {
        list.add(NewAssinment(
          title: dataDates[i],
          color: Colors.yellow[900],
        ));
      } else {
        list.add(NewAssinment(
          title: dataDates[i],
          color: Colors.green,
        ));
      }
    }

    return list;
  }
}
