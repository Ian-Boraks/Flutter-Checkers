// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';
import 'package:flutter_html/flutter_html.dart';

void main() => runApp(MyApp());

enum codeProjects { attractions, museumRunner, empty, redK, blueK }
enum cadProjects { btSpeaker }

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
    this.selected = false,
    required this.onPressed,
    required this.color,
    required this.text,
  }) : super(key: key);

  final bool selected;
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
                backgroundColor: MaterialStateProperty.all<Color>(selected ? Colors.black12 : Colors.transparent),
                overlayColor: MaterialStateProperty.all<Color>(selected ? Colors.transparent : Colors.black12),
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
  var selectedCodeProject = codeProjects.empty;

  Widget GetSelectedCodeProject() {
    switch (selectedCodeProject) {
      case codeProjects.attractions:
        return Expanded(
          flex: 8,
          child: Container(
            alignment: Alignment.center,
            child: Html(
              // FIXME: Make this full screen , make a post on stackoverflow
              // shrinkWrap: true,
              data: r"""
                  <iframe src="https://www.ianboraks.info/2022TSA-VidGame/"></iframe>
                """,
            ),
          ),
        );

      case codeProjects.museumRunner:
        return Expanded(
          flex: 8,
          child: Text("museumRunner"),
        );

      default:
        return Expanded(
          flex: 8,
          child: Text("NULL"),
        );
    }
  }

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
                            icon: Icons.videogame_asset,
                            size: 100,
                            text: "Museum\nRunner",
                            color: Colors.red,
                            selected: selectedCodeProject == codeProjects.museumRunner,
                            onPressed: () {
                              selectedCodeProject = codeProjects.museumRunner;
                              (context as Element).markNeedsBuild();
                            },
                          ),
                          ListItemWidget(
                            icon: Icons.map,
                            color: Colors.blue,
                            size: 100,
                            text: "Attractions.cc",
                            selected: selectedCodeProject == codeProjects.attractions,
                            onPressed: () {
                              selectedCodeProject = codeProjects.attractions;
                              print("Photo");
                              (context as Element).markNeedsBuild();
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
                  GetSelectedCodeProject(),
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
