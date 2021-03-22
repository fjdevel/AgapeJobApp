import 'package:agape_job_app/pages/detalleplaza.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SingUpLogin extends StatefulWidget {
  @override
  _SingUpLoginState createState() => _SingUpLoginState();
}

class _SingUpLoginState extends State<SingUpLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetallePlaza()));
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: '¿Aún no tienes cuenta?',
              style: TextStyle(
                  color: dPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              )
          ),
          TextSpan(
              text: ' Regístrate',
              style: TextStyle(
                  color: dPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )
          )
        ]
        ),
      ),
    );
  }
}
