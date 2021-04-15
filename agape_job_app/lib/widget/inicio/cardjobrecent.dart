import 'package:agape_job_app/pages/detalleplaza.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardJobRecent extends StatelessWidget {
  dynamic job;


  CardJobRecent(this.job);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: size.height*0.15,
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
           Expanded(child: Column(
             children: [
               Container(
                 child: Text(this.job['descripcion'],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),
                 ),
               ),
               Container(
                 child: Text(this.job['salario']),
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
                     MaterialPageRoute(builder: (context) => DetallePlaza(job)),
                   );
                 },)
             ],
           ),)
          ],
        ),
      ),
    );
  }
}
