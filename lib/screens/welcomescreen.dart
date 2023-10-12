import 'package:flutter/material.dart';
import 'package:quizzler/screens/QuizScreen.dart';

import '../components/tile.dart';


class welcomeScreen extends StatelessWidget {
  static String ScreenID = 'welcomeScreen';
  const welcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(29),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/72gi.gif', height: 200,),
                  SizedBox(height: 50,),
                  tilef('10 Mcqs with only one possible answer', Icons.add),
                  tilef('Only 15 seconds per question so use it wisely', Icons.timelapse),
                  tilef('1 Mcq is equal to 10 points', Icons.score_rounded),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, quizScreen.ScreenID);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.amber[900],
                          borderRadius: BorderRadius.circular(10),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Text(
                          'Start !',
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              // start btn end
              SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
