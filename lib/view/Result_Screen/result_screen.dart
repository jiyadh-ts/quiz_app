import 'package:flutter/material.dart';
import 'package:quiz_app/Dummydb.dart';
import 'package:quiz_app/view/Screen_One/Screen_one.dart';
import 'package:quiz_app/view/home_screen/quiz_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    required this.rightanswercount,
    required this.WrongAnswercount, 
    required this.questions,
  });

  final int rightanswercount;
  final int WrongAnswercount;
    final List<Map<String, dynamic>> questions;


  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int starcount = 0;

  @override
  void initState() {
    // Corrected method name
    super.initState();
    starcount = calpercentage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      bottom: index == 1 ? 10 : 0, left: 15, right: 15),
                  child: Icon(
                    Icons.star,
                    color: index < starcount ? Colors.yellow : Colors.grey,
                    size: index == 1 ? 80 : 50,
                  ),
                ),
              ),
            ),
            Text(
              "Congrats",
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
            Text(
              "${calpercentage().toStringAsFixed(1)}% Score",
              style: TextStyle(color: Colors.green, fontSize: 28),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Correct Answer: ${widget.rightanswercount}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Wrong Answer: ${widget.WrongAnswercount}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Skipped Questions: ${widget.questions.length - widget.rightanswercount - widget.WrongAnswercount}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ScreenOne()));
              },
              child: Text("Restart"),
            ),
          ],
        ),
      ),
    );
  }

  int calpercentage() {
    double percentage =
        (widget.rightanswercount / Dummydb.answers.length) * 100;
    if (percentage >= 80) {
      return 3;
    } else if (percentage >= 50) {
      return 2;
    } else if (percentage >= 30) {
      return 1;
    } else {
      return 0;
    }
  }
}
