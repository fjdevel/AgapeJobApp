import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FormBusqueda extends StatefulWidget {
  @override
  _FormBusquedaState createState() => _FormBusquedaState();
}

class _FormBusquedaState extends State<FormBusqueda> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.height - 80,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(Icons.close),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: 1,
                  child: Center(
                    child: Text(
                      "Búsqueda",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black
                      ),
                    ),
                  ),
                )
              ],
            )
          ),

        ],
      ),
    );
  }
}
