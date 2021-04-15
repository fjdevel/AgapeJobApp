import 'package:flutter/material.dart';

class DropDownText extends StatefulWidget {
  String hint;
  List<String> items;
  DropDownText(this.hint, this.items);
  @override
  _DropDownTextState createState() => _DropDownTextState();
}

class _DropDownTextState extends State<DropDownText> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(left: 15.0, right: 10.0),
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [ BoxShadow(
                color: Colors.black26,
                offset: const Offset(0.0, 3.0),
                blurRadius: 1.2,
                spreadRadius: 0.5
            )
            ]
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text(widget.hint),
            value: _chosenValue,
            style: TextStyle(color: Colors.black),
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        )
    );
  }
}