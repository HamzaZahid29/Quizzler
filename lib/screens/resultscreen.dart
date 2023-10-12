
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class resultScreen extends StatefulWidget {

  static String ScreenID = 'resultScreen';
  int currentScore;

  resultScreen(this.currentScore);

  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(19),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Statistics',
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: CircularPercentIndicator(
                      radius: 100,
                      lineWidth: 30,
                      animationDuration: 1000,
                      animation: true,
                      percent: widget.currentScore / 10,
                      progressColor: Colors.amber[900],
                      backgroundColor: Colors.grey.shade200,
                      center: Text(
                        '${widget.currentScore * 10}',
                        style: TextStyle(
                            fontSize: 26, color: Colors.grey.shade500),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  widget.currentScore > 5
                      ? "Great Job You Won "
                      : "Ohh You lost better luck next time",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.amber[900],
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'correct answers :',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                            Text(
                              '${widget.currentScore}',
                              style: TextStyle(
                                  color: Colors.amber[900],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'wrong answers :',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                            Text(
                              '${10 - widget.currentScore}',
                              style: TextStyle(
                                  color: Colors.amber[900],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Score :',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                            Text(
                              '${widget.currentScore * 10}',
                              style: TextStyle(
                                  color: Colors.amber[900],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Result :',
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                            Text(
                              widget.currentScore > 5? 'Won':"lost",
                              style: TextStyle(
                                  color: Colors.amber[900],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.amber[900],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Restart',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
