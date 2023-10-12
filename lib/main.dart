import 'package:flutter/material.dart';
import 'package:quizzler/screens/welcomescreen.dart';
import 'package:quizzler/screens/QuizScreen.dart';
import 'package:quizzler/screens/resultscreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main(){
  runApp(
      MaterialApp(
    initialRoute:'splash',
    routes: {
      'splash': (context) {

        return AnimatedSplashScreen(
            duration: 3000,
            splash: Container(
                height: 500,
                child: Image.asset('assets/72gi.gif',height: 500,)),
            nextScreen: welcomeScreen(),
            splashTransition: SplashTransition.fadeTransition,
            
            backgroundColor: Colors.white);

      },

      welcomeScreen.ScreenID: (context) {
        return welcomeScreen();
      },
      quizScreen.ScreenID: (context) {
        return quizScreen();

      },
      resultScreen.ScreenID: (context) {
        final int result = ModalRoute.of(context)!.settings.arguments as int;
        return resultScreen(result);
      }

    },
  ));
}
