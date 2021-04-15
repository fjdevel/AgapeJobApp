import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BuscaDropMenu extends StatefulWidget {
  @override
  _BuscaDropMenuState createState() => _BuscaDropMenuState();
}

class _BuscaDropMenuState extends State<BuscaDropMenu> {
  String valor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        child: Card(
          color: dSecundaryColor,
          elevation: 1,
          shadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: valor,
                items: <String>['Ascendente', 'Descendente', 'Fecha', 'Ubicación'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                  );
                }).toList(),
                hint: Text(
                  "Más recientes"
                ),
                onChanged: (String value){
                  setState(() {
                    valor = value;
                  });
                },
              ),
            ),
          )
            ),
      ),
    );

  }
}
