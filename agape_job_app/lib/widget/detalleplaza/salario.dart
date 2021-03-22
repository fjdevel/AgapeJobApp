import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Salario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "\$0.00 / Month",
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}