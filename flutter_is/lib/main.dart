// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class VerticallyScrollingItem extends StatelessWidget {
  const VerticallyScrollingItem({
    Key? key,
    this.fontSize = 30,
    @required this.mainText,
  }) : super(key: key);

  final mainText;
  final fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Text(
        mainText,
        style: TextStyle(fontSize: fontSize),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white70,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      for (var i = 0; i <= 100; i++)
                        VerticallyScrollingItem(
                          mainText: "help " + i.toString(),
                        )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(color: Color(0xFF9370DB)), // Bruh why is hex with the A value in the front :(
            ),
          ],
        ),
      ),
    );
  }
}
