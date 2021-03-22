import 'package:agape_job_app/widget/inicio/cardjob.dart';
import 'package:agape_job_app/widget/inicio/cardjobrecent.dart';
import 'package:flutter/material.dart';

class ListRecientes extends StatefulWidget {
  @override
  _ListRecientesState createState() => _ListRecientesState();
}

class _ListRecientesState extends State<ListRecientes> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: size.width*0.85,
      height: size.height*0.35,
      child: ListView(
        children: [
          CardJobRecent(),
          CardJobRecent(),
          CardJobRecent(),
          CardJobRecent(),

        ],
      ),
    );
  }
}
