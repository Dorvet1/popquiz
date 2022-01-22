// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:popquiz/app/modules/home/presenter/widgets/list_view.dart';

class ReceveidHistoric {
  String title;
  List<dynamic> answer;
  ReceveidHistoric({@required this.answer, @required this.title});
}

class HistoricForm extends StatelessWidget {
  final ReceveidHistoric receveidHistoric;
  const HistoricForm({Key key, @required this.receveidHistoric})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TextButton(
          onPressed: () {
            Modular.to.pop();
          },
          child: Text('Voltar')),
      appBar: AppBar(
        title: Text(receveidHistoric.title),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
                itemCount: receveidHistoric.answer.length,
                itemBuilder: (context, index) {
                  return ListViewWidget(
                      textTitle: receveidHistoric.answer[index]['titulo'],
                      textDescription: receveidHistoric.answer[index]
                          ['descricao'],
                      textAnswer: receveidHistoric.answer[index]['resposta'],
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.height * 0.8);
                }),
          ),
        ),
      ),
    );
  }
}
