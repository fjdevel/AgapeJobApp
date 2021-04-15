import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  String label;
  String data;
  TextInfo(this.label,this.data);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.9,
      margin: EdgeInsets.only(bottom: size.height*0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(margin: EdgeInsets.only(right: size.width*0.05),child: Text("$label",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),),
          Expanded(child: Text("$data"))
        ],
      ),
    );
  }
}
