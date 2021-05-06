import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profesion extends StatelessWidget {
  String text;

  Profesion(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}