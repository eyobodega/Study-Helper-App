import 'package:flutter/material.dart';
import 'package:flutterproj/profile_page.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'assignments_page.dart';
import 'dart:convert';

// final FirebaseApp app = FirebaseApp(
//     options: FirebaseOptions(
//   googleAppID: '',
//   apiKey: '',
//   databaseURL: '',
// ));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Productivity Tutor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var jdata = "";

class _MyHomePageState extends State<MyHomePage> {
  final DBRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: DefaultTabController(
        length: 2,
        child: new Scaffold(
          body: Stack(children: <Widget>[
            TabBarView(
              children: [AssignmentsPage(), GpaCalculator()],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 290, top: MediaQuery.of(context).size.height * 0.785),
              child: FloatingActionButton(
                child: Icon(Icons.refresh),
                backgroundColor: Colors.red[900],
                onPressed: () {
                  readData();

                  // print(1);
                },
              ),
            ),
          ]),
          appBar: AppBar(
            title: new TabBar(
              tabs: [
                Tab(
                  text: ('Assigments'),
                  icon: new Icon(Icons.star),
                ),
                Tab(
                  text: ('Exam Calculator'),
                  icon: new Icon(
                    Icons.calculate,
                  ),
                ),
              ],
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.white,
            ),
            backgroundColor: Colors.red[600],
          ),
        ),
      ),
    );
  }

  void writeData() {
    DBRef.child("3").set({
      'Course': 'PHYS4020',
      'Deadline': '20:10:00 2021-4-3',
      'Type': 'Exam'
    });
  }

  void readData() {
    DBRef.once().then((DataSnapshot dataSnapShot) {
      // var f = (String s) => print(s);
      // print(f);

      // var jdata = (dataSnapShot.value);
      // // Map jsonData = json.decode(x);
      // print(jdata);
      print(dataSnapShot.value["Data"]);
      List jslist = [];
      for (var i = 0; i < dataSnapShot.value["Data"].length; i++) {
        var date = dataSnapShot.value["Data"][i]["Deadline"];
        var course = dataSnapShot.value["Data"][i]["Course"];
        var type = dataSnapShot.value["Data"][i]["Type"];
        var now = new DateTime.now();

        date = (date.toString().split(" "))[1];
        var datenow = (now.toString().split(" "))[0];
        var status = "";
        DateTime dateTimeCreatedAt =
            DateTime.parse(date.toString().split(" ")[0]);
        DateTime dateTimeNow = DateTime.now();
        final differenceInDays =
            dateTimeNow.difference(dateTimeCreatedAt).inDays;
        print('$differenceInDays');
        if (differenceInDays == 0) {
          status = "DUE TODAY";
        } else if (differenceInDays > 0) {
          status = "OVERDUE";
        } else {
          status = "UPCOMING";
        }
        var output = "DATE: " +
            date +
            " PM \n" +
            course +
            ": " +
            type +
            " \nSTATE: " +
            status;

        jslist.add(output);
      }
      // print(dataSnapShot.value);
    });
  }

  // Map jsonData = json.decode(x);
}
