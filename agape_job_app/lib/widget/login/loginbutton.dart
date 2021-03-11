import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 25),
      width: 340,
      child: RaisedButton(
        onPressed: () =>  Navigator.of(context).pushNamed("/inicio"),
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: dPrimaryColor,
        child: Text(
          'Iniciar Sesión',
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
