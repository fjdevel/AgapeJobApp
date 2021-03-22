import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Ubicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        "Departamento, Municipio",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
      ),
    );
  }
}