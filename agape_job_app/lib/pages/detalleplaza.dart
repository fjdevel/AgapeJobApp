import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/common/dplazabar.dart';
import 'package:agape_job_app/widget/detalleplaza/detallebody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetallePlaza extends StatefulWidget {
  dynamic job;

  DetallePlaza(this.job);

  @override
  _DetallePlazaState createState() => _DetallePlazaState(this.job);
}

class _DetallePlazaState extends State<DetallePlaza> {
  dynamic job;

  _DetallePlazaState(this.job);

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dPrimaryColor,
      key: _scaffoldKey,
      appBar: DPlazaBar(job["descripcion"]),
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
            DetalleBody(job)
          ],
        ),
      ),
    );
  }
}