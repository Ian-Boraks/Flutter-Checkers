// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';
import 'dart:js' as js;

import 'package:flutter_html/flutter_html.dart';
import 'package:web_browser/web_browser.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

enum codeProjects { attractions, museumRunner, empty, portfolio, blueK }
enum cadProjects { btSpeaker }

class MyApp extends StatefulWidget {
  static var selectedCodeProject = codeProjects.empty;
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class NewTabButton extends StatelessWidget {
  const NewTabButton({
    Key? key,
    this.alignment = Alignment.center,
    this.height,
    this.color = Colors.cyan,
    required this.child,
    required this.url,
  }) : super(key: key);

  final Widget child;
  final Alignment alignment;
  final double? height;
  final String url;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: child,
        onPressed: () {
          js.context.callMethod('open', [
            url
          ]);
        },
      ),
    );
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

class NewProjectExpanded extends StatelessWidget {
  const NewProjectExpanded({
    Key? key,
    this.bottomBarChild,
    this.color = Colors.cyan,
    required this.url,
  }) : super(key: key);

  final Widget? bottomBarChild;
  final String url;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(right: 10),
        child: WebBrowser(
          initialUrl: url,
          javascriptEnabled: true,
          interactionSettings: WebBrowserInteractionSettings(
            topBar: NewTabButton(
              url: url,
              child: Text("OPEN in New Tab"),
              color: color,
            ),
            bottomBar: Container(
              margin: EdgeInsets.all(10),
              child: bottomBarChild,
            ),
          ),
        ),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  void _resetTabs() {
    _changeStateCodeProject(codeProjects.empty);
  }

  _changeStateCodeProject(scp) {
    setState(() {
      MyApp.selectedCodeProject = scp;
    });
  }

  Widget _getSelectedCodeProject(scp) {
    switch (scp) {
      case codeProjects.museumRunner:
        return NewProjectExpanded(
          url: 'https://ian-boraks.github.io/2022TSA-VidGame',
          color: Colors.red,
        );

      case codeProjects.attractions:
        return NewProjectExpanded(
          bottomBarChild: Text("This application requires geo-location. Because of that, the best way to view the app is opening it in a new tab."),
          url: 'https://ian-boraks.github.io/FBLA-2021-22--Coding-Programming/',
          color: Colors.blue,
        );

      case codeProjects.portfolio:
        return NewProjectExpanded(
          url: '/',
          color: Colors.cyan,
        );

      default:
        return Expanded(flex: 8, child: Container());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (context) {
            final tabController = DefaultTabController.of(context)!;
            tabController.addListener(() {
              _resetTabs();
            });
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey,
                bottom: TabBar(
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
                                text: "TSA\nMuseum\nRunner",
                                color: Colors.red,
                                selected: MyApp.selectedCodeProject == codeProjects.museumRunner,
                                onPressed: () {
                                  _changeStateCodeProject(codeProjects.empty);
                                  Future.delayed(const Duration(milliseconds: 100), () {
                                    _changeStateCodeProject(codeProjects.museumRunner);
                                  });
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.map,
                                color: Colors.blue,
                                size: 100,
                                text: "FBLA\nAttractions.cc",
                                selected: MyApp.selectedCodeProject == codeProjects.attractions,
                                onPressed: () {
                                  _changeStateCodeProject(codeProjects.empty);
                                  Future.delayed(const Duration(milliseconds: 100), () {
                                    _changeStateCodeProject(codeProjects.attractions);
                                  });
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.auto_stories_outlined,
                                color: Colors.cyan,
                                size: 100,
                                text: "Portfolio",
                                onPressed: () {
                                  _changeStateCodeProject(codeProjects.empty);
                                  Future.delayed(const Duration(milliseconds: 100), () {
                                    _changeStateCodeProject(codeProjects.portfolio);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      _getSelectedCodeProject(MyApp.selectedCodeProject),
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
            );
          },
        ),
      ),
    );
  }
}
