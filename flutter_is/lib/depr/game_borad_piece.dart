import 'package:flutter/material.dart';
import 'global_import.dart';

class GameBoardPiece extends StatefulWidget {
  final gp? squareType;
  final VoidCallback? notifyParent;

  GameBoardPiece({
    Key? key,
    @required this.squareType,
    @required this.notifyParent,
  }) : super();

  @override
  State<GameBoardPiece> createState() => _GameBoardPieceState();
}

class _GameBoardPieceState extends State<GameBoardPiece> {
  Color _pickColor() {
    switch (widget.squareType) {
      case (gp.red):
        return Colors.red;
      case (gp.blue):
        return Colors.blue;
      case (gp.redK):
        return Colors.pink;
      case (gp.blueK):
        return Colors.cyan;
      case (gp.empty):
        return Colors.transparent;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        ),
        child: const Text(''),
        onPressed: () {
          (context as Element).markNeedsBuild();
        },
      ),
      decoration: BoxDecoration(
        color: _pickColor(),
        shape: BoxShape.circle,
      ),
    );
  }
}
