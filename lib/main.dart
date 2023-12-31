import 'package:flutter/material.dart';
import 'dart:async';

import 'package:myflutter/screens/history.dart';

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
  Color bgcolor = const Color.fromARGB(255, 247, 117, 117);
  int pomodoroCount = 0;
  bool isPlay = false;
  int timeLeft = 10;
  late Timer timer;

  //MyApp - method
  void clickHistory() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HistoryScreen()));
  }

  //When click timer 'Play'
  void clickPlayBtn() {
    setState(() {
      isPlay = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 1) {
        setState(() {
          timeLeft--;
        });
      } else {
        setState(() {
          pomodoroCount++;
          isPlay = false;
          timeLeft = 10;
          timer.cancel();

          //transform to rest time display
          bgcolor = const Color.fromARGB(255, 30, 136, 3);
        });
      }
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
      //reset MyApp's property except 'pomodoroCount'
      timeLeft = 10;
      isPlay = false;
      timer.cancel();
    });
  }

  //reset your pomodoro count
  void clickResetPomodoro() {
    setState(() {
      //reset MyApp's property
      pomodoroCount = 0;
      timeLeft = 10;
      isPlay = false;
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgcolor,
        body: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: clickHistory,
                icon: const Icon(Icons.history),
              ),
            ),
            Column(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Today's Pomodoro",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                pomodoroCount.toString(),
                                style: const TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: clickResetPomodoro,
                            icon: const Icon(Icons.restart_alt),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


/*
To Do UI
  - history 열람창 구현
  - 현재 모드 출력창 -studymode/restmode
  - timer Date format
To Do 기능
  - pomodoro time -> 변수 하나로 통합
  - pomodoro 1회 성공시 배경화면 초록색으로 전환, 휴식시간으로 전환
  - pomodoro type을 만들어서 공부시간/휴식시간을 구분
      -studymode: time counter 감소형식
                  적색 배경화면
                  일반적인 pomodoro화면
      -rest mode: time counter 증가형식
                  원할때 studymode로 넘어갈 수 있음
                  녹색 배경화면
  -history기능: 몇시부터 공부했는지, rest mode에서 쉰 시간, 등을 히스토리로 기록해서 볼 수 있게 함
*/