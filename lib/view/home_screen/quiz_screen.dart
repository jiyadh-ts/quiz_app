import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/view/Result_Screen/result_screen.dart';
import 'package:quiz_app/view/home_screen/widgets/optioncard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.questions});

  final List<Map<String, dynamic>> questions;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int questionIndex = 0;
  int? answerIndex;
  int correctAnswercount = 0;
  int WrongAnswercount = 0;

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[questionIndex];
    final options = currentQuestion['options'] as List<String>;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              "${questionIndex + 1}/ ${widget.questions.length}",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          children: [
            _buildQuestionSection(currentQuestion['question']),
            const SizedBox(height: 30),
            Column(
              children: List.generate(
                options.length,
                (index) => Optionscard(
                  onTap: () {
                    if (answerIndex == null) {
                      setState(() {
                        answerIndex = index;
                      });
                      if (answerIndex == currentQuestion['answer']) {
                        correctAnswercount++;
                        print("AnswerCount${correctAnswercount}");
                      } else {
                        WrongAnswercount++;
                      }
                    }
                  },
                  options: options,
                  optionindex: index,
                  col: getColor(index),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (questionIndex < widget.questions.length - 1) {
            answerIndex = null;

            setState(() {
              questionIndex++;
            });
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(
                          rightanswercount: correctAnswercount,
                          WrongAnswercount: WrongAnswercount,
                          questions: widget.questions,
                        )));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: const Center(
              child: Text('Next',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(int index) {
    if (answerIndex != null) {
      if (index == widget.questions[questionIndex]['answer']) {
        return Colors.green;
      }
      if (answerIndex == index) {
        if (answerIndex == widget.questions[questionIndex]['answer']) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      }
    }
    return Colors.white;
  }

  Widget _buildQuestionSection(String question) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey,
            ),
            child: Text(
              question,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          answerIndex == widget.questions[questionIndex]['answer']
              ? Lottie.asset('assets/animations/Animation-1724055717710.json')
              : SizedBox(),
        ],
      ),
    );
  }
}
