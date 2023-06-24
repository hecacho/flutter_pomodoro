import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void clickPlayBtn() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE7626C),
        body: Column(
          children: [
            const Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  "24:00",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 65,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Center(
                child: IconButton(
                  constraints: const BoxConstraints(
                    minHeight: 120,
                    minWidth: 120, 
                  ),
                  onPressed: clickPlayBtn,
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 90,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                color: const Color(0xFFFFFFFF),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "pomodoro",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
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
