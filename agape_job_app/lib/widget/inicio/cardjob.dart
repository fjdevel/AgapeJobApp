import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';

class CardJob  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.6,
      height: size.width*0.18,
      margin: EdgeInsets.only(right: 20),
      child: Card(
        elevation:5,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: dSecundaryColor
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Image(image:  AssetImage('assets/images/agape logo.PNG'),),
                  title:  Text("Empresa X",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                ),
                Align(

                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 10,left: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: dPrimaryColorT,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Diseñador Grafico",style: TextStyle(color: Colors.white,fontSize: 15),),
                  ),
                ),//puesto
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: dPrimaryColorT,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("\$450 / mes",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20,right:20,top: 5,bottom: 5),
                      margin: EdgeInsets.only(right: 10,top: 10),
                      decoration: BoxDecoration(
                        color: dPrimaryColorT,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Ver",style: TextStyle(color: Colors.white,fontSize: 15),),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
