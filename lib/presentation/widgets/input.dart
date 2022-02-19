import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final double margintop;
  final TextInputType inputType;
  final Icon? prefix;
  final Icon? sufix;
  final bool? shadown;

  Input(
      {required this.controller,
      required this.placeholder,
      required this.inputType,
      required this.prefix,
      required this.sufix,
      required this.shadown,
      this.margintop = 0});

  @override
  Widget build(BuildContext context) {
    var widthBorder = 1.5;
    var radius = 16.0;

    return Container(
      decoration: BoxDecoration(
        color:shadown! ? Color(0xE5EBF00): Colors.white,
        borderRadius: BorderRadius.circular(16)
      ),

      height: 45,
      margin: EdgeInsets.only(top: margintop),
      child: Theme(
        data: new ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          keyboardType: inputType,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
          controller: controller,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              prefixIcon: prefix,
              suffixIcon: sufix,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: Colors.blue, width: widthBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(color: Colors.blue, width: widthBorder),
              ),
              hintText: placeholder,
              hintStyle: TextStyle(color:shadown! ? Colors.blueGrey  : Colors.blue, fontSize: 15.0)),
        ),
      ),
    );
  }
}
