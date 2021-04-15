import 'package:flutter/material.dart';

class ChkGraduado extends StatefulWidget {
  @override
  _ChkGraduadoState createState() => _ChkGraduadoState();
}

class _ChkGraduadoState extends State<ChkGraduado> {
  bool isGraduadoCFP = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20, left: 15.0),
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.black87),
                child: Checkbox(
                  value: isGraduadoCFP,
                  checkColor: Colors.white,
                  activeColor: Colors.brown,
                  onChanged: (value) {
                    setState(() {
                      isGraduadoCFP = value;
                    });
                  },
                )),
            Text('¿Graduado del CFP?',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),)
          ],
        )

    );
  }
}