import 'package:agape_job_app/pages/detalleplaza.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';

class CardJob  extends StatelessWidget {

  dynamic job;


  CardJob(this.job);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.6,
      height: size.height*0.18,
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
                  title:  Text("",style: TextStyle(fontSize: size.height*0.025,fontWeight: FontWeight.w600),),
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
                    child: Text(this.job['descripcion'],style: TextStyle(color: Colors.white,fontSize: size.height*0.02),),
                  ),
                ),//puesto
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: size.height*0.015,left: 10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: dPrimaryColorT,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("\$"+this.job['salario']+" / mes",style: TextStyle(color: Colors.white,fontSize: size.height*0.02),),
                    ),
                    GestureDetector(child: Container(
                      padding: EdgeInsets.only(left: 20,right:20,top: 5,bottom: 5),
                      margin: EdgeInsets.only(right: 10,top: 10),
                      decoration: BoxDecoration(
                        color: dPrimaryColorT,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Ver",style: TextStyle(color: Colors.white,fontSize: size.height*0.02),),

                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetallePlaza(this.job)),
                      );
                    },),
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
