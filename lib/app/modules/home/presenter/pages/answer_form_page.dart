// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/presenter/widgets/list_view.dart';
import 'package:popquiz/app/modules/home/presenter/widgets/stack_widget.dart';

class ReceveidAnswers {
  String title;
  List<dynamic> answer;
  List<dynamic> listAnswer;
  ReceveidAnswers(
      {@required this.answer, @required this.title, @required this.listAnswer});
}

class AnswerForm extends StatefulWidget {
  final ReceveidAnswers receveidAnswers;
  const AnswerForm({Key key, @required this.receveidAnswers}) : super(key: key);

  @override
  _AnswerFormState createState() => _AnswerFormState();
}

ListMockForm listOfHistoricForm;
int index = 0;
String answerForm;
List<String> answerList = [];
final controller = TextEditingController();
var changeWidget = false;
Color colorRgboBlue = Color.fromRGBO(21, 55, 93, 1);

class _AnswerFormState extends State<AnswerForm> {
  @override
  void initState() {
    answerList.clear();
    controller.clear();
    index = 0;
    changeWidget = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int count = widget.receveidAnswers.answer.length - 1;

    var width = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
        bottomNavigationBar: changeWidget
            ? Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: colorRgboBlue),
                    onPressed: () {
                      Modular.to.pop();
                    },
                    child: Text('Voltar')),
              )
            : null,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: colorRgboBlue,
              elevation: 0.0,
            ),
            preferredSize: Size.fromHeight(80)),
        body: !changeWidget
            ? Column(
                children: [
                  StackWidget(
                      color: colorRgboBlue, text: widget.receveidAnswers.title),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: width,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Título:'),
                                  SizedBox(width: 10),
                                  Text(widget.receveidAnswers.answer[index]
                                      ['titulo']),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Descrição:'),
                                  SizedBox(width: 10),
                                  Text(widget.receveidAnswers.answer[index]
                                      ['descricao']),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Resposta:'),
                                  SizedBox(width: 10),
                                  Container(
                                    height: 100,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: controller,
                                          onChanged: (value) {
                                            answerForm = value;
                                          },
                                          maxLength: 250,
                                          maxLines: 3,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: 'Resposta'),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: index == count
                                ? () {
                                    setState(() {
                                      answerList.add(answerForm);
                                      changeWidget = !changeWidget;
                                    });
                                    FocusScope.of(context).unfocus();
                                  }
                                : () {
                                    setState(() {
                                      answerList.add(answerForm);
                                      index += 1;
                                      controller.clear();
                                    });
                                  },
                            child: index == count
                                ? Text('Enviar')
                                : Text('Proximo'))),
                  )
                ],
              )
            : Column(children: [
                StackWidget(color: colorRgboBlue, text: 'Respostas'),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: count + 1,
                        itemBuilder: (context, index) {
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: ListView.builder(
                                  itemCount: count,
                                  itemBuilder: (context, index) {
                                    return ListViewWidget(
                                      textTitle: widget
                                              .receveidAnswers.listAnswer[index]
                                          ['questionario']['titulo'],
                                      textDescription: widget.receveidAnswers
                                          .answer[index]['descricao'],
                                      textAnswer: answerList[index] == null
                                          ? ''
                                          : answerList[index],
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    );
                                  }));
                        }),
                  ),
                )
              ]));
  }
}
