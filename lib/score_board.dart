import 'dart:collection';

import 'package:bingo/bingo_box.dart';
import 'package:bingo/number_box.dart';
import 'package:flutter/material.dart';

class ScoreBoard extends StatefulWidget {
  String scoreText;
  Color borderColor;
  var BINGOString = {"B" : false,"I": false,"N": false,"G": false,"O": false};
  ScoreBoard({ Key? key, required this.scoreText, required this.borderColor ,required this.BINGOString}) : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.scoreText,style: TextStyle(fontSize: 15,color: Colors.black38), ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
                widget.BINGOString.entries.map((e) => BingoBox(letter: e.key, borderColor: widget.borderColor,filled: e.value,)).toList()
                ),
          ],
        ),
      ),
      decoration: BoxDecoration(
     border: Border.all(
      color: Colors.black45,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(12),
  )
    );
  }
}