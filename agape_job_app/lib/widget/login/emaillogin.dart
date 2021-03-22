import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EmailLogin extends StatefulWidget {
  final TextEditingController controller;
  const EmailLogin(this.controller);

  @override
  _EmailLoginState createState() => _EmailLoginState();

}

class _EmailLoginState extends State<EmailLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          top: size.height*0.06
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
                  top: 10
              ),
              padding: EdgeInsets.only(top: 2),
              child: Text(
                "Correo Electrónico",
                style: TextStyle(fontSize: 11),
              )
          ),
          TextField(
            controller: widget.controller,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'ejemplo@mail.com',
              hintStyle: TextStyle(fontSize: 14),
              contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
              isDense: true,
            ),
            textAlignVertical: TextAlignVertical.bottom,
          ),
        ],
      ),
    );
  }
}
