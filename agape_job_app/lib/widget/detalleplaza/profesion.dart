import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profesion extends StatelessWidget {
  String text;

  Profesion(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        this.text,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}