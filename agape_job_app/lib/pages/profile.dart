import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/common/dplazabar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: dPrimaryColor,
      appBar: DPlazaBar("Mi Perfil"),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(80)
            )
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(

                  margin: EdgeInsets.only(top: size.height*0.02),
                  child: Column(
                    children: [
                      Container(
                        width: size.width*0.4,
                        child: Image.network("https://www.trecebits.com/wp-content/uploads/2019/02/Persona-1-445x445.jpg"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height*0.02),
                        child: Text("Teresa Perez",style: TextStyle(fontSize: 30,),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height*0.01),
                        child: Text("San Salvador, El Salvador",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200),),
                      ),
                  Container(
                    margin: EdgeInsets.only(top: size.height*0.01),
                    child: Text("Diseñadora Grafica",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                  ),
                      Divider(
                        color: Colors.grey,
                        indent: 20,
                        endIndent: 20,
                        thickness: 1.5,
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
