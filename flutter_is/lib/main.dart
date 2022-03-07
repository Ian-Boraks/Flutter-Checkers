// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';
import 'dart:js' as js;
import 'dart:math';

import 'checkers/main.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:web_browser/web_browser.dart';
import 'package:flutter/material.dart';

final List<Widget> photoAstro = [
  Image.asset('images/photography/astro/ianb.arw-30112021-0013.jpg'),
  Image.asset('images/photography/astro/ianb.arw-30112021-0014.jpg'),
  Image.asset('images/photography/astro/Stack2.jpg'),
  Image.asset('images/photography/astro/staroutput.final1.jpg'),
  Image.asset('images/photography/astro/staroutput.final2.jpg'),
];

final List<Widget> photoCity = [
  Image.asset('images/photography/city/ianb.arw-30112021-0006.jpg'),
  Image.asset('images/photography/city/ianb.arw-30112021-0007.jpg'),
  Image.asset('images/photography/city/ianb.arw-30112021-0008.jpg'),
  Image.asset('images/photography/city/ianb.arw-30112021-0009.jpg'),
];

final List<Widget> photoNature = [
  Image.asset('images/photography/nature/DSC00020.jpg'),
  Image.asset('images/photography/nature/ianb.arw-30112021-0016.jpg'),
  Image.asset('images/photography/nature/ianb.jpg'),
];

final List<Widget> photoLandscape = [
  Image.asset('images/photography/sky_landscape/ianb.arw-30112021-0001.jpg'),
  Image.asset('images/photography/sky_landscape/ianb.arw-30112021-0002.jpg'),
  Image.asset('images/photography/sky_landscape/ianb.arw-30112021-0012.jpg'),
  Image.asset('images/photography/sky_landscape/ianb.arw-30112021-0021.jpg'),
];

final List<Widget> photoWildlife = [
  Image.asset('images/photography/wildlife/ianb.arw-30112021-0003.jpg'),
  Image.asset('images/photography/wildlife/ianb.arw-30112021-0004.jpg'),
  Image.asset('images/photography/wildlife/ianb.arw-30112021-0005.jpg'),
  Image.asset('images/photography/wildlife/ianb.arw-30112021-0010.jpg'),
  Image.asset('images/photography/wildlife/ianb.arw-30112021-0018.jpg'),
  Image.asset('images/photography/wildlife/ianb.arw-30112021-0019.jpg'),
  Image.asset('images/photography/wildlife/ianb.arw-30112021-0020.jpg'),
];

final List<Widget> photoMisc = [];

void main() => runApp(MyApp());

List shuffle(List items) {
  void main() => runApp(MyApp());
  var random = Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

enum codeProjects { empty, phaseShift, attractions, museumRunner, portfolio, checkers }
enum cadProjects { empty, btSpeaker }
enum photoSort { all, astro, city, nature, landscape, wildlife, misc }

class MyApp extends StatefulWidget {
  static var selectedCodeProject = codeProjects.empty;
  static var selectedCadProject = cadProjects.empty;
  static var selectedPhotoSort = photoSort.all;

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
      margin: EdgeInsets.only(top: 10, bottom: 10),
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
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
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

  _changeSelectedPhotoSort(sp) {
    setState(() {
      MyApp.selectedPhotoSort = sp;
    });
  }

  List<Widget> _getSelectedPhotos(sp) {
    // TODO: Dynamically load the photos from images/photogrpahy instead of using the hardcoded list made with the py file
    List<Widget> photos = [];
    switch (sp) {
      case photoSort.astro:
        photos = photoAstro;
        break;
      case photoSort.city:
        photos = photoCity;
        break;
      case photoSort.nature:
        photos = photoNature;
        break;
      case photoSort.landscape:
        photos = photoNature;
        break;
      case photoSort.wildlife:
        photos = photoWildlife;
        break;
      case photoSort.misc:
        photos = photoMisc;
        break;
      default:
        photos.addAll(photoAstro);
        photos.addAll(photoCity);
        photos.addAll(photoLandscape);
        photos.addAll(photoMisc);
        photos.addAll(photoNature);
        photos.addAll(photoWildlife);
        break;
    }

    shuffle(photos);
    return photos;
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

      case codeProjects.checkers:
        // FIXME: Make this size responsive so that I don't overflow
        return Expanded(flex: 8, child: MyCheckers());
      case codeProjects.phaseShift:
        return Expanded(flex: 8, child: Container(color: Colors.transparent));

      default:
        return Expanded(flex: 8, child: Container(color: Color(0xFF937FDB)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
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
                bottom: TabBar(
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
                  // CODE
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
                                  _changeStateCodeProject(codeProjects.phaseShift);
                                  Future.delayed(const Duration(milliseconds: 50), () {
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
                                  _changeStateCodeProject(codeProjects.phaseShift);
                                  Future.delayed(const Duration(milliseconds: 50), () {
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
                                  _changeStateCodeProject(codeProjects.phaseShift);
                                  Future.delayed(const Duration(milliseconds: 50), () {
                                    _changeStateCodeProject(codeProjects.portfolio);
                                  });
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.grid_view,
                                color: Colors.purple,
                                size: 100,
                                text: "Flutter\nCheckers",
                                onPressed: () {
                                  _changeStateCodeProject(codeProjects.phaseShift);
                                  Future.delayed(const Duration(milliseconds: 50), () {
                                    _changeStateCodeProject(codeProjects.checkers);
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
                  // Photography
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
                                icon: Icons.collections,
                                selected: MyApp.selectedPhotoSort == photoSort.all,
                                size: 100,
                                text: "All",
                                color: Colors.orange,
                                onPressed: () {
                                  _changeSelectedPhotoSort(photoSort.all);
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.auto_awesome,
                                selected: MyApp.selectedPhotoSort == photoSort.astro,
                                size: 100,
                                text: "Astro",
                                color: Colors.red,
                                onPressed: () {
                                  _changeSelectedPhotoSort(photoSort.astro);
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.location_city,
                                selected: MyApp.selectedPhotoSort == photoSort.city,
                                color: Colors.blue,
                                size: 100,
                                text: "City",
                                onPressed: () {
                                  _changeSelectedPhotoSort(photoSort.city);
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.park,
                                selected: MyApp.selectedPhotoSort == photoSort.nature,
                                color: Colors.cyan,
                                size: 100,
                                text: "Nature",
                                onPressed: () {
                                  _changeSelectedPhotoSort(photoSort.nature);
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.landscape,
                                selected: MyApp.selectedPhotoSort == photoSort.landscape,
                                color: Colors.purple,
                                size: 100,
                                text: "Landscape",
                                onPressed: () {
                                  _changeSelectedPhotoSort(photoSort.landscape);
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.emoji_nature,
                                selected: MyApp.selectedPhotoSort == photoSort.wildlife,
                                color: Colors.green,
                                size: 100,
                                text: "Wildlife",
                                onPressed: () {
                                  _changeSelectedPhotoSort(photoSort.wildlife);
                                },
                              ),
                              ListItemWidget(
                                icon: Icons.miscellaneous_services,
                                selected: MyApp.selectedPhotoSort == photoSort.misc,
                                color: Colors.grey,
                                size: 100,
                                text: "Misc",
                                onPressed: () {
                                  _changeSelectedPhotoSort(photoSort.misc);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: CustomScrollView(
                          primary: false,
                          slivers: <Widget>[
                            SliverPadding(
                              padding: const EdgeInsets.all(3.0),
                              sliver: SliverGrid.count(
                                mainAxisSpacing: 1, //horizontal space
                                crossAxisSpacing: 1, //vertical space
                                crossAxisCount: 3, //number of images for a row
                                children: _getSelectedPhotos(MyApp.selectedPhotoSort),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // CAD
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
