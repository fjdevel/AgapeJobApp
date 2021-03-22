import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height*0.05),
      height: size.height*0.17,
      width: size.width*0.8,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/logoagape.png'),
            fit: BoxFit.fitWidth
        ),
      ),
    );
  }
}
