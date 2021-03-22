import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetalleLista extends StatelessWidget {

  final List<String> entradas = <String>['Requisito 1', 'Requisito 2', 'Requisito 3', 'Requisito 4', 'Requisito 5', 'Requisito N'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(5.0, 15.0, 10.0, 0.0),
        itemCount: entradas.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 30,
            child: Text('* ${entradas[index]}'),
          );
        },
      ),
    );
  }
}
