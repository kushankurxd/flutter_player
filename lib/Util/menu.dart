import 'package:flutter/material.dart';

class MenuXD extends StatefulWidget{

  Color color1,color2;

  MenuXD(this.color1,this.color2);

  @override
  State createState() {
    return _MenuXDState();
  }
}

class _MenuXDState extends State<MenuXD> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 22.4,
          height: 2.4,
          color: widget.color1,
        ),
        SizedBox(height: 5,),
        Container(
          width: 13,
          height: 2.4,
          color: widget.color2,
        ),
      ],
    );
  }
}