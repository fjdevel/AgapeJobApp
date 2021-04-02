import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/common/dplazabar.dart';
import 'package:agape_job_app/widget/detalleplaza/detallebody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetallePlaza extends StatefulWidget {
  @override
  _DetallePlazaState createState() => _DetallePlazaState();
}

class _DetallePlazaState extends State<DetallePlaza> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dPrimaryColor,
      key: _scaffoldKey,
      appBar: DPlazaBar(),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(80)
            )
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            DetalleBody()
          ],
        ),
      ),
    );
  }
}