import 'package:flutter/material.dart';

import 'game_borad_piece.dart' as gb_p;
import 'global_import.dart';

class GameBoardStatefull extends StatefulWidget {
  static final List<String> _textList = [
    'Red - Select a piece to move',
    'Red - Select an empty space to move to',
    'Blue - Select a piece to move',
    'Blue - Select an empty space to move to',
  ];

  static int _textListIndex = 0;

  static _createColors() {
    List tempBoard = [];
    for (var y = 0; y < 8; y++) {
      int startInt = (y % 2) > 0 ? 1 : 0;
      List tempRow = [];
      for (var x = 0; x < 8; x++) {
        tempRow.add((x + startInt) % 2);
      }
      tempBoard.add(tempRow);
    }
    return tempBoard;
  }

  static final List boardColors = _createColors();

  static gp _setGamePiece(x, startInt, y) {
    switch (((x + startInt) % 2)) {
      case 1:
        if (y > 4) {
          return gp.red;
        } else {
          return gp.blue;
        }
      default:
        return gp.empty;
    }
  }

  static _createInitGameBoard() {
    List tempBoard = [];
    for (var y = 0; y < 8; y++) {
      int startInt = (y % 2) > 0 ? 1 : 0;
      List tempRow = [];
      if (y == 3 || y == 4) {
        for (var x = 0; x < 8; x++) {
          tempRow.add(gp.empty);
        }
      } else {
        for (var x = 0; x < 8; x++) {
          tempRow.add(_setGamePiece(x, startInt, y));
        }
      }
      tempBoard.add(tempRow);
    }
    return tempBoard;
  }

  static final List _initGameBoard = _createInitGameBoard();

  static getText() {
    if (_textListIndex >= _textList.length) {
      _textListIndex = 0;
    }
    return _textList[_textListIndex];
  }

  @override
  State<GameBoardStatefull> createState() => _GameBoardStatefullState();
}

class _GameBoardStatefullState extends State<GameBoardStatefull> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(GameBoardStatefull.getText()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1.25),
                  1: FlexColumnWidth(1.25),
                  2: FlexColumnWidth(1.25),
                  3: FlexColumnWidth(1.25),
                  4: FlexColumnWidth(1.25),
                  5: FlexColumnWidth(1.25),
                  6: FlexColumnWidth(1.25),
                  7: FlexColumnWidth(1.25)
                },
                border: TableBorder.all(width: 1.0, color: Colors.black),
                children: [
                  for (int y = 0; y < 8; y++)
                    TableRow(
                      children: [
                        gb_p.GameBoardPiece(squareType: gp.empty, notifyParent: refresh()),
                      ],
                    )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
