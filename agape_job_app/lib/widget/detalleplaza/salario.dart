import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Salario extends StatelessWidget {
  String text;

  Salario(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "\$"+this.text,
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}