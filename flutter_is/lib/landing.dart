import 'package:flutter/material.dart';

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
        body: Row(
          children: [
            Flexible(
              child: Center(
                child: Column(
                  children: [
                    Flexible(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Image.asset('images/icons/linkedin.png'),
                            onPressed: () => {},
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
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Image.asset('images/icons/instagram.png'),
                            onPressed: () => {},
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
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            child: Image.asset('images/icons/github.png'),
                            onPressed: () => {},
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
                      child: Image.asset('images/icons/surprised.png'),
                    ),
                    flex: 6,
                  ),
                  const Flexible(
                    child: Center(
                      child: Text("Hi my name is Ian"),
                    ),
                    flex: 4,
                  ),
                ],
              ),
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
