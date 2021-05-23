import 'package:flutter/material.dart';

class DataPicker extends StatefulWidget {
  DateTime currentDate;

  DataPicker(date){
    if(date==null)
     currentDate = DateTime.now();
    else{
      date = date;
    }
  }

  @override
  _DataPickerState createState() => _DataPickerState();
}

class _DataPickerState extends State<DataPicker> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        helpText: 'Seleccionar Fecha',
        cancelText: 'Cancelar',
        confirmText: 'Aceptar',
        fieldLabelText: 'Ingresar Fecha',
        context: context,
        initialDatePickerMode: DatePickerMode.day,
        initialDate: widget.currentDate,
        firstDate: DateTime(1975),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != widget.currentDate)
      setState(() {
        widget.currentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width *0.85,
      height: 40.0,
      margin: EdgeInsets.only(top: 5.0),
      padding: EdgeInsets.only(left: 15.0),
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
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
                  "${widget.currentDate.day.toString()}-${widget.currentDate.month.toString()}-${widget.currentDate.year.toString()}")
          ),
          IconButton(icon: Icon(
              Icons.calendar_today),
              onPressed: () => _selectDate(context)
          )
        ],
      ),
    );
  }
}
