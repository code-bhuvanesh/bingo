import 'package:flutter/material.dart';

import 'model/box.dart';

class BingoBox extends StatefulWidget {
  String  _letter;
  Color _borderColor;
  bool filled = false;
  BingoBox({ Key? key , required String letter, required Color borderColor , required this.filled}) :_letter = letter,_borderColor = borderColor, super(key: key);

  @override
  State<BingoBox> createState() => _BingoBoxState();
}

class _BingoBoxState extends State<BingoBox> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width/7,
      width: MediaQuery.of(context).size.width/7,
      child: Center(child: Text(widget._letter)),
      decoration: BoxDecoration(
      gradient: widget.filled? const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:  [
                Color.fromARGB(255, 16, 75, 179),
                Colors.lightBlue,
              ],
            ): null,
    border: Border.all(
      color: widget._borderColor,
      width: 4,
    ),
    borderRadius: BorderRadius.circular(10),
    )
    );
  }
}