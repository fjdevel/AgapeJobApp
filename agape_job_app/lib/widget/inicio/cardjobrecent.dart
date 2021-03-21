import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardJobRecent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: size.height*0.10,
      child: Card(
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: new DecorationImage(fit: BoxFit.fitWidth,image:  AssetImage('assets/images/agape logo.PNG'))
              ),
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text("Ayudante de cocina \nRestaurante la prueba",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Text("\$350 / mes"),
            )
          ],
        ),
      ),
    );
  }
}
