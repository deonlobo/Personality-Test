import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 14) {
      resultText = 'You are awsome and innocent !';
    } else if (resultScore <= 26) {
      resultText = 'Pretty Likeable!';
    } else if (resultScore <= 36) {
      resultText = 'You are ... strange !?';
    } else {
      resultText = 'You are soo badass!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
