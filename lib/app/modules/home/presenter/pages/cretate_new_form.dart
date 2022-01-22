// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';


class CreateNewForm extends StatefulWidget {
  const CreateNewForm({Key key}) : super(key: key);

  @override
  State<CreateNewForm> createState() => _CreateNewFormState();
}
Color colorRgboBlue = Color.fromRGBO(21, 55, 93, 1);
class _CreateNewFormState extends State<CreateNewForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: colorRgboBlue,
        ),
        body: Container(
          color: colorRgboBlue,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Center(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextFormField(
                            obscureText: false,

                            keyboardType: TextInputType.text,
                            // ignore: missing_return

                            decoration:
                                // ignore: prefer_const_constructor
                                InputDecoration(
                                    labelText: 'Título do formulário'),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            // ignore: missing_return
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Preencha todos os campos';
                              }
                            },
                            decoration:
                                // ignore: prefer_const_constructors
                                InputDecoration(
                                    labelText: 'Título da pergunta'),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            // ignore: missing_return

                            decoration:
                                // ignore: prefer_const_constructors
                                InputDecoration(labelText: 'Pergunta'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: colorRgboBlue),
                                  onPressed: () {},
                                  child: Text('Cadastrar')),
                              SizedBox(
                                width: 20,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(color: Colors.blueAccent),
                                  ))
                            ],
                          )
                        ],
                      ))),
            ),
          ),
        ));
  }
}
