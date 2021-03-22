import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LogoDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width * 0.45,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black12),
      child: Center(
        child: Text(
          "Logo image"
        ),
      ),
      );

  }
}
