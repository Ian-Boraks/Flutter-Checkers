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
                          child: IconButton(
                            icon: Icon(Icons.linked_camera_outlined),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                      flex: 25,
                      fit: FlexFit.tight,
                    ),
                    Flexible(
                      child: Center(
                        child: Container(
                          child: IconButton(
                            icon: Icon(Icons.code_outlined),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                      flex: 25,
                      fit: FlexFit.tight,
                    ),
                    Flexible(
                      child: Center(
                        child: Container(
                          child: IconButton(
                            icon: Icon(Icons.code_outlined),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                      flex: 25,
                      fit: FlexFit.tight,
                    ),
                    Flexible(
                      child: Center(
                        child: Container(
                          child: IconButton(
                            icon: Icon(Icons.code_outlined),
                            onPressed: () => {},
                          ),
                        ),
                      ),
                      flex: 25,
                      fit: FlexFit.tight,
                    ),
                  ],
                ),
              ),
              flex: 2,
              fit: FlexFit.tight,
            ),
            Flexible(
              child: Container(
                color: Colors.red,
              ),
              flex: 8,
            ),
          ],
        ),
      ),
    );
  }
}
