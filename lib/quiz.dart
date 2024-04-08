import 'package:adv_basics/data/questiondumy.dart';
import 'package:adv_basics/question.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(changeScreen);
  // }
  final List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void changeScreen() {
    setState(() {
      activeScreen = "question-screen"; //const Question();
    });
  }

  void chooseAnwer(String anwer) {
    selectedAnswers.add(anwer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void resetQuiz() {
    setState(() {
      activeScreen = "question-screen";
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(changeScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = Question(onSelectAnswer: chooseAnwer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        resetFunction: resetQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 60, 33, 106),
                Color.fromARGB(255, 112, 23, 167)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
