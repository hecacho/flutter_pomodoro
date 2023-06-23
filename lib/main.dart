import 'package:flutter/material.dart';

void main() {
  runApp(const APP());
}

class APP extends StatelessWidget {
  const APP({super.key});

  void clickPlayBtn() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 0, 0) ,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 35,
            color: Color(0xFF232B55),
          ),
          displayMedium: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 61, 73, 138),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      home: Scaffold(
        
        body: Center(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Center(
                  child: Container(
                    
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Center(
                  child: IconButton(
                    onPressed: clickPlayBtn,
                    icon: const Icon(Icons.play_circle),
                  ),
                ),
              ),
              const Flexible(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      Text("as"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
