import 'package:agape_job_app/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PasswordLogin extends StatefulWidget {

  @override
  _PasswordLoginState createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          top: size.height*0.02
      ),
      width: size.width * 0.85,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              width: 1,
              color: Colors.white,
              style: BorderStyle.solid
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: const Offset(0.0, 3.0),
                blurRadius: 1.2,
                spreadRadius: 0.5
            )
          ]
      ),
      child: Stack(
        children: [
          Container(
              margin: EdgeInsets.only(
                  left: 20,
                  top: size.height*0.01
              ),
              padding: EdgeInsets.only(
                  top: 2
              ),
              child: Text(
                "Contraseña",
                style: TextStyle(fontSize: 11),
              )
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '*****************',
              hintStyle: TextStyle(fontSize: 14),
              contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
              isDense: true
            ),
            textAlignVertical: TextAlignVertical.bottom,
            onChanged: (text){
              var prov = Provider.of<Proveedor>(context,listen: false);
              prov.setPass(text);
            } ,
          ),
        ],
      ),
    );
  }
}
