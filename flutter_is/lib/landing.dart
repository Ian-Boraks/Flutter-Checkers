import 'package:flutter/material.dart';
import 'dart:js' as js;

class MyLanding extends StatefulWidget {
  const MyLanding({Key? key}) : super(key: key);

  @override
  State<MyLanding> createState() => _MyLandingState();
}

class _MyLandingState extends State<MyLanding> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        child: Row(
          children: [
            Flexible(
              child: Center(
                child: Column(
                  children: [
                    Flexible(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Image.asset(
                              'images/icons/linkedin.png',
                              color: Colors.white,
                              isAntiAlias: true,
                            ),
                            onPressed: () => {
                              js.context.callMethod('open', [
                                'https://www.linkedin.com/in/ian-boraks/'
                              ])
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      flex: 3,
                      fit: FlexFit.tight,
                    ),
                    Flexible(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Image.asset(
                              'images/icons/instagram.png',
                              color: Colors.white,
                              isAntiAlias: true,
                            ),
                            onPressed: () => {
                              js.context.callMethod('open', [
                                'https://www.instagram.com/ianb.arw/'
                              ])
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      flex: 3,
                      fit: FlexFit.tight,
                    ),
                    Flexible(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Image.asset(
                              'images/icons/github.png',
                              color: Colors.white,
                              isAntiAlias: true,
                            ),
                            onPressed: () => {
                              js.context.callMethod('open', [
                                'https://github.com/Ian-Boraks'
                              ])
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      flex: 3,
                      fit: FlexFit.tight,
                    ),
                  ],
                ),
              ),
              flex: 2,
              fit: FlexFit.tight,
            ),
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: Center(
                      // child: Image.asset(''),
                      child: Icon(
                        Icons.three_mp,
                        size: 400,
                        color: Colors.pink,
                      ),
                    ),
                    flex: 6,
                    fit: FlexFit.tight,
                  ),
                  const Flexible(
                    child: Center(
                      child: Text("Hi my name is Ian"),
                    ),
                    flex: 4,
                    fit: FlexFit.tight,
                  ),
                ],
              ),
              flex: 8,
            )
          ],
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/icons/tree.png'),
          ),
        ),
      )),
    );
  }
}
