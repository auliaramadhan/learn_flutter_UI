import 'package:flutter/material.dart';


class GestureExample extends StatefulWidget {
  GestureExample({Key? key}) : super(key: key);

  @override
  State<GestureExample> createState() => _GestureExampleState();
}

class _GestureExampleState extends State<GestureExample> {
  String status ='' ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () => setState(() {
            status = 'onLongPress';
          }),
          onPanUpdate: (details) {
            setState(() {
            status = 'onPanUpdate ${details.localPosition}';
            });
            
          }, 
          onVerticalDragUpdate: (details) {
            setState(() {
            status = 'onVerticalDragUpdate ${details.localPosition}';
            });
          }, 
          onHorizontalDragUpdate: (details) {
            setState(() {
            status = 'onHorizontalDragUpdate ${details.localPosition}';
            });
          }, 
          onDoubleTapDown:(details) {
            setState(() {
            status = 'onDoubleTap ${details.localPosition}';
            });
          }, 
          onDoubleTap: () => setState(() {
            status = 'onDoubleTap';
          }),
          child: Container(
            height: 400,
            width: 400,
            color: Colors.red,
            child: SizedBox(),
          ),
        ),
        Text('status : $status')
      ],
    );
  }
}