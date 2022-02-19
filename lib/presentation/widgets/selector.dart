import 'package:flutter/material.dart';

class SelectorWidget extends StatefulWidget {
  SelectorWidget({Key? key}) : super(key: key);

  List<String> opciones = ["Cedula Ciudadania", "TI"];
  String valorDesplegable = "Cedula Ciudadania";

  @override
  _SelectorWidgetState createState() => _SelectorWidgetState();
}

class _SelectorWidgetState extends State<SelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 45,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            // This sets the color of the [DropdownButton] itself
            color: Colors.grey[50],
            border: Border.all(
              color: Colors.blue,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(18))),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 10,
                  margin: EdgeInsets.only(top: 8.0, left: 8.0),
                  width: double.infinity,
                  child: Text(
                    "Tipo de documento",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.start,
                  ),
                ),
                Theme(
                  // This sets the color of the [DropdownMenuItem]
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.grey[50],
                  ),
                  child: Container(
                    height: 20,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 8),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        child: DropdownButton(
                          isExpanded: true,
                          iconSize: 0.0,
                          value: widget.valorDesplegable,
                          items: widget.opciones
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                                textAlign: TextAlign.start,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              print(value);
                              widget.valorDesplegable = value.toString();
                            });
                          },
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 10,
                top: 10,
                child:  Icon(Icons.check_circle_outline, color: Colors.blue))
          ],
        ));
  }
}
