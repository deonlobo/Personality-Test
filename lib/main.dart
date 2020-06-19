import 'package:first_app/quiz.dart';
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personality Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Test Your Personality'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 20},
        {'text': 'Red', 'score': 15},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
        {'text': 'Pink', 'score': 15}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 45},
        {'text': 'Elephant', 'score': 15},
        {'text': 'Lion', 'score': 5},
        {'text': 'Tiger', 'score': 1},
      ],
    },
    {
      'questionText': 'Who\'s your favorite person?',
      'answers': [
        {'text': 'Deon', 'score': 1},
        {'text': 'Deon', 'score': 1},
        {'text': 'Deon', 'score': 1},
        {'text': 'Deon', 'score': 1}
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    _questionIndex = 0;
    _totalScore = 0;
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: (_questionIndex < _questions.length)
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore , _resetQuiz),
    );
  }
}
