// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:popquiz/app/modules/home/domain/entitites/list_of_historic_form.dart';

import 'package:popquiz/app/modules/home/presenter/pages/historic_form_page.dart';

class HistoricWidget extends StatefulWidget {
  const HistoricWidget({Key key}) : super(key: key);

  @override
  State<HistoricWidget> createState() => _HistoricWidgetState();
}

List<dynamic> listDynamicHistoricForm = [];

class _HistoricWidgetState extends State<HistoricWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: listDynamicHistoricForm.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/homepage/historicform',
                          arguments: ReceveidHistoric(
                              answer: listDynamicHistoricForm[index]
                                  ['questionario']['questoes'],
                              title: listDynamicHistoricForm[index]
                                  ['questionario']['titulo']));
                    },
                    child: Card(
                      elevation: 7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.deepPurpleAccent,
                      // ignore: prefer_const_literals_to_create_immutables
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      listDynamicHistoricForm[index]
                                          ['questionario']['titulo'],
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(FontAwesomeIcons.chartLine,
                                        color: Colors.white)),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('Vizualizar Respostas',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            }));
  }
}
