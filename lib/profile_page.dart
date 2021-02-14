import 'package:flutter/material.dart';

class GpaCalculator extends StatefulWidget {
  @override
  _GpaCalculatorState createState() => _GpaCalculatorState();
}

class _GpaCalculatorState extends State<GpaCalculator> {
  int currentindex = 0;
  String result = "";
  double mark = 0;
  double finalMark = 0;
  double examWorth = 0;
  TextEditingController currentController = TextEditingController();
  TextEditingController finalController = TextEditingController();
  TextEditingController examWorthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: new Center(
                child: new Text(
              "Final Exam Calculator",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            )),
            elevation: 0.0,
            backgroundColor: Color(0xfffafafa),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Enter your mark: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  TextField(
                    controller: currentController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Current class mark in %",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Enter your desired mark for the class: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  TextField(
                    controller: finalController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Final class mark in %",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "What is your exam worth?: ",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  TextField(
                    controller: examWorthController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Final weight %",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [radioButton("Calculate", Colors.red, 0)],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "You need $result% on the exam",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void calculatePercent(double mark, double finalMark, double examWorth) {
    double finalresult =
        100 * ((finalMark - (mark * (1 - examWorth / 100))) / (examWorth));
    String temp = finalresult.toStringAsFixed(2);

    setState(() {
      result = temp;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        child: FlatButton(
          color: currentindex == index ? color : Colors.grey[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          onPressed: () {
            // check if num < 100
            setState(() {
              mark = double.parse(currentController.value.text);
              finalMark = double.parse(finalController.value.text);
              examWorth = double.parse(examWorthController.value.text);
            });

            if (mark <= 100 &&
                finalMark <= 100 &&
                examWorth <= 100 &&
                mark >= 0 &&
                finalMark >= 0 &&
                examWorth >= 0) {
              calculatePercent(mark, finalMark, examWorth);
            }
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
            ),
          ),
        ),
      ),
    );
  }
}
