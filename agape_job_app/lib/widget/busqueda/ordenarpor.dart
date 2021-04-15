import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/busqueda/buscadrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OrdenarPor extends StatefulWidget {
  @override
  _OrdenarPorState createState() => _OrdenarPorState();
}

class _OrdenarPorState extends State<OrdenarPor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      padding: EdgeInsets.all(10),
      color: dSecundaryColor,
      child: Row(
        children: [
          Container(
            child: Text(
              "Ordenar por",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
            ),
          ),
          Container(
            child: BuscaDropMenu(),
          )
        ],
      ),
    );
  }
}
