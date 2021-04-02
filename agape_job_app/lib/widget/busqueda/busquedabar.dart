import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BusquedaBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 50,
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Icon(Icons.close),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Búsqueda",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
    );
  }
}
