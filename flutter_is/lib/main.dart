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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey,
            bottom: const TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 23,
              ),
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.code_outlined,
                    color: Colors.red,
                  ),
                  text: "Code",
                ),
                Tab(
                  icon: Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.blue,
                  ),
                  text: "Photography",
                ),
                Tab(
                  icon: Icon(
                    Icons.threed_rotation_outlined,
                    color: Colors.cyan,
                  ),
                  text: "CAD",
                ),
              ],
            ),
            centerTitle: true,
            title: const Text(
              'Ian Borak\'s Electronic Portfolio',
              textAlign: TextAlign.center,
            ),
          ),
          body: TabBarView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ListItemWidget(
                            icon: Icons.code_outlined,
                            size: 100,
                            text: "Code",
                            color: Colors.red,
                            onPressed: () {
                              print("Code");
                            },
                          ),
                          ListItemWidget(
                            icon: Icons.photo_camera_outlined,
                            color: Colors.blue,
                            size: 100,
                            text: "Photo",
                            onPressed: () {
                              print("Photo");
                            },
                          ),
                          ListItemWidget(
                            icon: Icons.threed_rotation_outlined,
                            color: Colors.cyan,
                            size: 100,
                            text: "CAD",
                            onPressed: () {
                              print("CAD");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(color: Color(0xFFFF301B)), // Bruh why is hex with the A value in the front :(
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ListItemWidget(
                            icon: Icons.code_outlined,
                            size: 100,
                            text: "Code",
                            color: Colors.red,
                            onPressed: () {
                              print("Code");
                            },
                          ),
                          ListItemWidget(
                            icon: Icons.photo_camera_outlined,
                            color: Colors.blue,
                            size: 100,
                            text: "Photo",
                            onPressed: () {
                              print("Photo");
                            },
                          ),
                          ListItemWidget(
                            icon: Icons.threed_rotation_outlined,
                            color: Colors.cyan,
                            size: 100,
                            text: "CAD",
                            onPressed: () {
                              print("CAD");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(color: Color(0xFF9370DB)), // Bruh why is hex with the A value in the front :(
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.center,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ListItemWidget(
                            icon: Icons.code_outlined,
                            size: 100,
                            text: "Code",
                            color: Colors.red,
                            onPressed: () {
                              print("Code");
                            },
                          ),
                          ListItemWidget(
                            icon: Icons.photo_camera_outlined,
                            color: Colors.blue,
                            size: 100,
                            text: "Photo",
                            onPressed: () {
                              print("Photo");
                            },
                          ),
                          ListItemWidget(
                            icon: Icons.threed_rotation_outlined,
                            color: Colors.cyan,
                            size: 100,
                            text: "CAD",
                            onPressed: () {
                              print("CAD");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(color: Color(0xFFF470DB)), // Bruh why is hex with the A value in the front :(
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
