import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AplicarButton extends StatefulWidget {
  @override
  _AplilcarButtonState createState() => _AplilcarButtonState();
}

class _AplilcarButtonState extends State<AplicarButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      child: RaisedButton(
        onPressed: () =>  null,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: dPrimaryColor,
        child: Text(
          'Aplicar Ahora',
          style: TextStyle(
              color: dSecundaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}