import 'package:flutter/material.dart';

class BTNEdit extends StatefulWidget {
  @override
  _BTNBTNEditState createState() => _BTNBTNEditState();
}

class _BTNBTNEditState extends State<BTNEdit> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 25),
      child: RaisedButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: Colors.brown,
        child: Text(
          'Ingresar Datos',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w300
          ),
        ),
        onPressed: null,
      ),
    );
  }
}
