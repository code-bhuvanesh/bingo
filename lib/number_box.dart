import 'package:flutter/material.dart';

import 'model/box.dart';

class NumberBox extends StatefulWidget {
  late int count;
  bool pressed = false;
  Function changePressed;
  NumberBox({ Key? key , required this.count, required this.pressed, required this.changePressed}) : super(key: key);

  @override
  State<NumberBox> createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  
  // @override
  // void initState() {
  //   count = widget.box.id + 1;
  //   pressed = widget.box.pressed;
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.pressed = widget.changePressed(widget.count);
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width/6,
        width: MediaQuery.of(context).size.width/6,
        child: Center(child: Text("${widget.count}")),
        decoration: BoxDecoration(
        gradient: widget.pressed? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:  [
                  Color.fromARGB(255, 16, 75, 179),
                  Colors.lightBlue,
                ],
              ): null,
      border: Border.all(
        color: const Color.fromARGB(255, 16, 75, 179),
        width: 3,
      ),
      borderRadius: BorderRadius.circular(12),
      )
      ),
    );
  }
}