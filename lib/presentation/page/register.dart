import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register/presentation/widgets/input.dart';
import 'package:register/presentation/widgets/selector.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  bool state1 = false;
  bool state2 = false;
  bool state3 = false;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    var textEditingController = TextEditingController();
    var height = queryData.size.width * 0.04;
    var heightRow = 20.0;
    var textSize = 11.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: queryData.size.width * 0.15,
                  ),
                  Text(
                    "Completa Registro",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 60.0, right: 60.0),
              child: Column(
                children: [
                  Input(
                      prefix: Icon(Icons.email),
                      controller: textEditingController,
                      placeholder: "Correo Eletronico",
                      inputType: TextInputType.text,
                      sufix: null,
                      shadown: true),
                  SizedBox(height: height),
                  Input(
                      prefix: Icon(Icons.person, color: Colors.blue,),
                      controller: textEditingController,
                      placeholder: "Nombre(s)",
                      inputType: TextInputType.text,
                      sufix: Icon(Icons.check_circle_outline, color: Colors.blue),
                      shadown: false),
                  SizedBox(height: height),
                  Input(
                      prefix: Icon(Icons.person),
                      controller: textEditingController,
                      placeholder: "Apellidos",
                      inputType: TextInputType.text,
                      sufix: Icon(Icons.check_circle_outline, color: Colors.blue),
                      shadown: false),
                  SizedBox(height: height),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Expanded(
                          child: Column(
                            children: [
                              columnForm(
                                  "Prefijo",
                                  Container(
                                    child: Container(
                                      width: 80,
                                      height: 45,
                                      child: Stack(
                                        children: [
                                          CountryCodePicker(
                                            hideMainText: true,
                                            showFlag: true,
                                            padding: EdgeInsets.all(0),
                                            initialSelection: 'CO',
                                            favorite: ['57', 'CO'],
                                            flagDecoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50)
                                            ),
                                          ),
                                          Positioned(
                                              top: 10,
                                              left: 45,
                                              child: Icon(
                                                  Icons.check_circle_outline))
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: columnForm(
                            "Numero de telefono",
                            Column(
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: Input(
                                      prefix: Icon(Icons.phone),
                                      controller: textEditingController,
                                      placeholder: "",
                                      inputType: TextInputType.number,
                                      sufix: Icon(Icons.check_circle_outline, color: Colors.blue),
                                      shadown: false),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  SelectorWidget(),
                  SizedBox(height: queryData.size.width * 0.03),
                  Input(
                      prefix: null,
                      controller: textEditingController,
                      placeholder: "Numero de documento",
                      inputType: TextInputType.text,
                      sufix: null,
                      shadown: true),
                  SizedBox(
                    height: queryData.size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Icon(Icons.network_wifi),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "¿Fuiste referido?",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  Input(
                      prefix: null,
                      controller: textEditingController,
                      placeholder: "Ingresa el codigo(no obligatorio)",
                      inputType: TextInputType.text,
                      sufix: null,
                      shadown: true),
                  SizedBox(
                    height: queryData.size.height * 0.04,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height),
                    height: heightRow,
                    child: Row(
                      children: [
                        Checkbox(
                            value: widget.state1,
                            onChanged: (data) =>
                                {widget.state1 = data!, setState(() {})}),
                        Expanded(
                            child: Text(
                          "Acepto Terminos y codiciones",
                          style:
                              TextStyle(fontSize: textSize, color: Colors.blue),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height),
                    height: heightRow,
                    child: Row(
                      children: [
                        Checkbox(
                            value: widget.state2,
                            onChanged: (data) =>
                                {widget.state2 = data!, setState(() {})}),
                        Expanded(
                            child: Text(
                          "Acepto el aviso de Privacidad",
                          style:
                              TextStyle(fontSize: textSize, color: Colors.blue),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height),
                    height: heightRow,
                    child: Row(
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.grey,
                          ),
                          child: Checkbox(
                              checkColor: Colors.white,
                              value: widget.state3,
                              onChanged: (data) =>
                                  {widget.state3 = data!, setState(() {})}),
                        ),
                        Expanded(
                            child: Text(
                          "Acepto el Manual de tratamiento de datos",
                          style:
                              TextStyle(fontSize: textSize, color: Colors.blue),
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(25.0))),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "Continuar",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: queryData.size.height * 0.04,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget columnForm(String text, Widget widget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 5,
        ),
        widget
      ],
    );
  }
}
