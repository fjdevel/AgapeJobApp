import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/common/dplazabar.dart';
import 'package:agape_job_app/widget/perfil/textinfo.dart';
import 'package:flutter/cupertino.dart';
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
                      // Container(
                      //   width: size.width*0.4,
                      //   child: Image.network("https://www.trecebits.com/wp-content/uploads/2019/02/Persona-1-445x445.jpg"),
                      // ),
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
                      ),
                      Container(
                        width: size.width*0.9,
                        height: size.height*0.5,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.01,right: size.width*0.01),
                              child: SingleChildScrollView(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: size.height*0.015),
                                        child: Center(
                                          child: Text("Datos de identificacion",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),),
                                      TextInfo("Carnet:","PP12312"),
                                      TextInfo("Sexo:","Femenino"),
                                      TextInfo("Genero:","Gay"),
                                      TextInfo("Fecha de nacimiento:", "12/02/87"),
                                      TextInfo("Estado Civel:","Casada"),
                                      TextInfo("Dui:", "09123121-0"),
                                      TextInfo("Nit:", "2312-1231231-123-1"),
                                      TextInfo("Departamento:", "San Salvador"),
                                      TextInfo("Municipio:", "San Salvador"),
                                      TextInfo("Direccion", "adhasd sahdasiudha dsahgdashasd adha dasdhaskjd dahsadjhasd adhas"),
                                      TextInfo("Numero Celular", "78312111"),
                                      TextInfo("Numero Fijo", "22122111"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.01,right: size.width*0.01),
                              child: SingleChildScrollView(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: size.height*0.015),
                                        child: Center(
                                          child: Text("Capacitaciones Recibidas",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),),
                                      TextInfo("Carnet:","PP12312"),
                                      TextInfo("Sexo:","Femenino"),
                                      TextInfo("Genero:","Gay"),
                                      TextInfo("Fecha de nacimiento:", "12/02/87"),
                                      TextInfo("Estado Civel:","Casada"),
                                      TextInfo("Dui:", "09123121-0"),
                                      TextInfo("Nit:", "2312-1231231-123-1"),
                                      TextInfo("Departamento:", "San Salvador"),
                                      TextInfo("Municipio:", "San Salvador"),
                                      TextInfo("Direccion", "adhasd sahdasiudha dsahgdashasd adha dasdhaskjd dahsadjhasd adhas"),
                                      TextInfo("Numero Celular", "78312111"),
                                      TextInfo("Numero Fijo", "22122111"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.01,right: size.width*0.01),
                              child: SingleChildScrollView(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: size.height*0.015),
                                        child: Center(
                                          child: Text("Capacitaciones Tecnicas",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),),
                                      TextInfo("Carnet:","PP12312"),
                                      TextInfo("Sexo:","Femenino"),
                                      TextInfo("Genero:","Gay"),
                                      TextInfo("Fecha de nacimiento:", "12/02/87"),
                                      TextInfo("Estado Civel:","Casada"),
                                      TextInfo("Dui:", "09123121-0"),
                                      TextInfo("Nit:", "2312-1231231-123-1"),
                                      TextInfo("Departamento:", "San Salvador"),
                                      TextInfo("Municipio:", "San Salvador"),
                                      TextInfo("Direccion", "adhasd sahdasiudha dsahgdashasd adha dasdhaskjd dahsadjhasd adhas"),
                                      TextInfo("Numero Celular", "78312111"),
                                      TextInfo("Numero Fijo", "22122111"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.01,right: size.width*0.01),
                              child: SingleChildScrollView(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: size.height*0.015),
                                        child: Center(
                                          child: Text("Discapacidades",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),),
                                      TextInfo("Carnet:","PP12312"),
                                      TextInfo("Sexo:","Femenino"),
                                      TextInfo("Genero:","Gay"),
                                      TextInfo("Fecha de nacimiento:", "12/02/87"),
                                      TextInfo("Estado Civel:","Casada"),
                                      TextInfo("Dui:", "09123121-0"),
                                      TextInfo("Nit:", "2312-1231231-123-1"),
                                      TextInfo("Departamento:", "San Salvador"),
                                      TextInfo("Municipio:", "San Salvador"),
                                      TextInfo("Direccion", "adhasd sahdasiudha dsahgdashasd adha dasdhaskjd dahsadjhasd adhas"),
                                      TextInfo("Numero Celular", "78312111"),
                                      TextInfo("Numero Fijo", "22122111"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        indent: 20,
                        endIndent: 20,
                        thickness: 1.5,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height*0.01,bottom: size.height*0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton.icon(onPressed: ()=>{}, label: Text("Editar"),icon: Icon(Icons.edit),),
                            ElevatedButton.icon(onPressed: ()=>{}, label: Text("Descargar cv"), icon:Icon(Icons.download_outlined),)
                          ],
                        ),
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
