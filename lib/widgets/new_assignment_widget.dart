import 'package:flutter/material.dart';

class NewAssinment extends StatelessWidget {
  final String title;
  final Color color;
  NewAssinment(
      {this.title,
      this.color}); //adds the title/what is displayed on each box widget
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12, left: 12, right: 12),
      padding: EdgeInsets.only(bottom: 10, left: 20, right: 10, top: 20),
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(children: <Widget>[
        Column(children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 17),
          )
        ])
      ]),
    );
  }
}
