import 'dart:async';

import 'package:quizzler/components/nextbtn.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quizzler/components/optionBtn.dart';
import 'package:quizzler/screens/resultscreen.dart';
import 'package:quizzler/Models/quizController.dart';


class quizScreen extends StatefulWidget {
  static String ScreenID = 'quizscreen';
  const quizScreen({super.key});

  @override
  State<quizScreen> createState() => _quizScreenState();
}

int currentOp = 5;
var length = QuizController().QuizList.length;
int currentQuestion = 0;
int playerScore = 0;
int seconds = 15;
late Timer timer;

class _quizScreenState extends State<quizScreen> {

  @override
  void initState() {
    startTimer();
    resetTimer();
    currentOp = 5;
    currentQuestion = 0;
    playerScore = 0;
    super.initState();
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(seconds > 0){
          seconds--;
        }else{
            if(currentQuestion < length-1) {
              currentQuestion++;
            }else{
              Navigator.pushReplacementNamed(
                  context, resultScreen.ScreenID,
                  arguments: playerScore);
            }
            resetTimer();
        }
      });
    });
  }
  void resetTimer(){
    timer.cancel();
    setState(() {
      seconds = 15;
    });
    startTimer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LinearPercentIndicator(
                        animationDuration: 1000,
                        animation: true,
                        percent: currentQuestion/length,
                        barRadius: Radius.circular(20),
                        lineHeight: 10,
                        progressColor: Colors.amber[900],
                        backgroundColor: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$currentQuestion / $length Completed",
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "seconds : $seconds",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade500),
                      ),
                        CircularPercentIndicator(
                        radius: 20,
                        animationDuration: 1000,
                        animation: false,
                        percent: seconds/15,
                        progressColor: Colors.amber[900],
                        backgroundColor: Colors.grey.shade200,
                        center: Text(
                          '$seconds',
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade500),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Question $currentQuestion',
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade100,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.grey.shade300,
                                  blurRadius: 1)
                            ]),
                        child: Center(
                          child: Text(
                            '${QuizController().QuizList[currentQuestion].question}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Options',
                        style: TextStyle(
                            color: Colors.grey.shade500, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade100,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Colors.grey.shade300,
                                    blurRadius: 1)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                OptionsBtn('a', '${QuizController().QuizList[currentQuestion].options[0]}', currentOp == 0, () {
                                  setState(() {
                                    currentOp = 0;
                                  });
                                }),
                                OptionsBtn('b', '${QuizController().QuizList[currentQuestion].options[1]}', currentOp == 1, () {
                                  setState(() {
                                    currentOp = 1;
                                  });
                                }),
                                OptionsBtn('c', '${QuizController().QuizList[currentQuestion].options[2]}', currentOp == 2, () {
                                  setState(() {
                                    currentOp = 2;
                                  });
                                }),
                                OptionsBtn('d', '${QuizController().QuizList[currentQuestion].options[3]}', currentOp == 3, () {
                                  setState(() {
                                    currentOp = 3;
                                  });
                                }),
                                SizedBox(
                                  height: 25,
                                ),
                                nextbtn(currentOp == 5 ? false : true, () {
                                  setState(() {
                                    if(currentQuestion < length-1 ){
                                      if(currentOp == QuizController().QuizList[currentQuestion].answerindex){
                                        print('Right answer');
                                        setState(() {
                                          playerScore++;
                                        });
                                      }
                                      setState(() {
                                        resetTimer();
                                        currentOp = 5;
                                        currentQuestion++;
                                      });
                                    }else{
                                      if(currentOp == QuizController().QuizList[currentQuestion].answerindex){
                                        setState(() {
                                          playerScore++;
                                        });
                                      }
                                      Navigator.pushReplacementNamed(
                                          context, resultScreen.ScreenID,
                                          arguments: playerScore);
                                    }
                                  });

                                })
                              ],
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
