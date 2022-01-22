// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_mock_form.dart';
import 'package:popquiz/app/modules/home/presenter/controller/home_controller.dart';
import 'package:popquiz/app/modules/home/presenter/pages/answer_form_page.dart';
import 'package:popquiz/app/modules/home/presenter/states/home_states.dart';
import 'package:popquiz/app/modules/home/presenter/widgets/historic_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

ReactionDisposer disposer;
List<dynamic> listDynamic = [];

final controller = Modular.get<HomeController>();
Color colorRgboBlue = Color.fromRGBO(21, 55, 93, 1);
var count = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    disposer = reaction((_) => controller.homeState, (state) {
      _manageState(state);
    });
    Future.delayed(Duration(milliseconds: 300)).then((_) =>
        {controller.searchListMock(), controller.searchListHistoricForm()});
    super.initState();
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: colorRgboBlue),
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                Modular.to.pushNamed('/homepage/createnewform');
              },
              icon: Icon(Icons.add)),
        ),
      ),
      appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 10),
            color: colorRgboBlue,
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image: AssetImage('assets/images/user_logo.jfif'))),
                ),
                SizedBox(
                  width: 10,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Olá,\n',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                      text: 'Checkmob.',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700))
                ])),
              ],
            ),
          )
          // ignore: prefer_const_literals_to_create_immutables
          ,
          preferredSize: Size.fromHeight(80)),
      body: listDynamic.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(height: 100, color: colorRgboBlue),
                      Center(child: HistoricWidget()),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: listDynamic.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Modular.to.pushNamed('/homepage/answerform',
                                    arguments: ReceveidAnswers(
                                        answer: listDynamic[index]
                                            ['questionario']['questoes'],
                                        title: listDynamic[index]
                                            ['questionario']['titulo'],
                                        listAnswer: listDynamic));
                              },
                              child: Container(
                                  height: 150,
                                  child: Card(
                                      elevation: 7,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Acessar Questionário',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                            Text(
                                              listDynamic[index]['questionario']
                                                      ['titulo']
                                                  .toString(),
                                            ),
                                          ]))),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _manageState(HomeState state) {
    if (state is SearhcListMockSucess) {
      setState(() {
        listDynamic = state.listMockForm.exemploOfListMock;
      });
    }
    if (state is SearchListMockFailed) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Nenhum dado encontrado')));
    }
    if (state is SearchHistoricFormSucess) {
      setState(() {
        listDynamicHistoricForm = state.listOfHistoricForm.historicListForm;
      });
    }
    if (state is SearchHistoricFormFailed) {
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Você não possui historicos de questionários')));
    }
  }
}
