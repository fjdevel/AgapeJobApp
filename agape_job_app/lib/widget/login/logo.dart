import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: 130,
      height: 130,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage('assets/images/agape logo.PNG'),
            fit: BoxFit.fitWidth
        ),
      ),
    );
  }
}
