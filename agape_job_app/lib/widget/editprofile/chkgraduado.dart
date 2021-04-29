import 'package:flutter/material.dart';

class ChkGraduado extends StatefulWidget {
  bool isGraduadoCFP = false;
  @override
  _ChkGraduadoState createState() => _ChkGraduadoState();
}

class _ChkGraduadoState extends State<ChkGraduado> {

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
                  value: widget.isGraduadoCFP,
                  checkColor: Colors.white,
                  activeColor: Colors.brown,
                  onChanged: (value) {
                    setState(() {
                      widget.isGraduadoCFP = value;
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