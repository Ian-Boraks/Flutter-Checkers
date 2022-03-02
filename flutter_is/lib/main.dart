// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key? key,
    this.alignment = Alignment.center,
    this.size,
    this.height,
    this.icon,
    required this.onPressed,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Alignment alignment;
  final String text;
  final double? height;
  final double? size;
  final Color color;
  final IconData? icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      alignment: alignment,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: ElevatedButton(
              child: Icon(
                icon ?? Icons.favorite,
                color: color,
                semanticLabel: text,
                size: (size ?? 0) > (height ?? 0) ? (height ?? size) : (size ?? height),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              onPressed: () {
                onPressed();
              },
            ),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            clipBehavior: Clip.hardEdge,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 23,
                      color: color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  // ignore: todo
                  // TODO: Add Click Icon with SVG
                  // Icon(
                  //   IconData(0xf05b5, fontFamily: 'MaterialIcons'),
                  // )
                ],
              ),
            ),
          )
        ],
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
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ListItemWidget(
                          icon: Icons.code_outlined,
                          size: 200,
                          text: "Code",
                          color: Colors.red,
                          onPressed: () {
                            print("Code");
                          },
                        ),
                        ListItemWidget(
                          icon: Icons.photo_camera_outlined,
                          size: 200,
                          text: "Photo",
                          color: Colors.blue,
                          onPressed: () {
                            print("Photo");
                          },
                        ),
                        ListItemWidget(
                          icon: Icons.threed_rotation_outlined,
                          size: 200,
                          text: "CAD",
                          color: Colors.cyan,
                          onPressed: () {
                            print("CAD");
                          },
                        ),
                      ],
                    ),
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
