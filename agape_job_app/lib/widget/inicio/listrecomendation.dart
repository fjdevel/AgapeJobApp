import 'package:agape_job_app/widget/inicio/cardjob.dart';
import 'package:flutter/material.dart';

class ListRecomendation extends StatefulWidget {
  @override
  _ListRecomendationState createState() => _ListRecomendationState();
}

class _ListRecomendationState extends State<ListRecomendation> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: size.width*0.85,
      height: size.height*0.22,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CardJob(),
          CardJob(),
          CardJob()

        ],
      ),
    );
  }
}
