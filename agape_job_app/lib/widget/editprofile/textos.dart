import 'package:flutter/material.dart';

class Texto extends StatelessWidget {
  String texto;
  Texto(this.texto);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Text(texto),
    );
  }
}
