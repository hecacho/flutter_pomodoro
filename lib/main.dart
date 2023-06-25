import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //MyApp - property
  bool isPlay = false;
  int timeLeft = 1500;
  late Timer timer;

  //MyApp - method
  //When click timer 'Play'
  void clickPlayBtn() {
    setState(() {
      isPlay = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
      });
    });
  }

  //When click timer 'Pause'
  void clickPauseBtn() {
    setState(() {
      isPlay = false;
    });
    timer.cancel();
  }

  //reset your timer time
  void clickResetTimer() {
    setState(() {
      //reset MyApp's property
      timeLeft = 1500;
      isPlay = false;
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE7626C),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  timeLeft.toString(),
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 65,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Center(
                child: IconButton(
                  constraints: const BoxConstraints(
                    minHeight: 120,
                    minWidth: 120,
                  ),
                  onPressed: isPlay ? clickPauseBtn : clickPlayBtn,
                  icon: isPlay
                      ? const Icon(
                          Icons.pause_circle,
                          size: 90,
                          color: Color(0xFFFFFFFF),
                        )
                      : const Icon(
                          Icons.play_circle,
                          size: 90,
                          color: Color(0xFFFFFFFF),
                        ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Reset Timer :",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                    ),
                  ),
                  Center(
                    child: IconButton(
                      color: const Color(0xFFFFFFFF),
                      icon: const Icon(Icons.restore),
                      onPressed: clickResetTimer,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Today's Pomodoro",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
