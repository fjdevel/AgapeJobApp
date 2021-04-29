import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  String hint;
  IconData icono;
  TextFields (this.hint, this.icono);
  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width *0.85,
        margin: EdgeInsets.only(top: 5.0),
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [ BoxShadow(
                color: Colors.black26,
                offset: const Offset(0.0, 3.0),
                blurRadius: 1.2,
                spreadRadius: 0.5
            )
            ]
        ),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              hintText: widget.hint,
            suffixIcon: null == widget.icono ? null : Icon(widget.icono),
            suffixIconConstraints: BoxConstraints(minWidth: 40),
          ),
        )
    );
  }
}