import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {

  final String textTitle;
  final String textDescription;
  final String textAnswer;
  final double height;
  final double width;
  const ListViewWidget(
      {Key key,
     
      @required this.textTitle,
      @required this.textDescription,
      @required this.textAnswer,
      @required this.height,
      @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Card(
          elevation: 7,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Título:'),
                      SizedBox(width: 10),
                      Text(textTitle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Descrição:'),
                      SizedBox(width: 10),
                      Text(textDescription),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Resposta:'),
                      SizedBox(width: 10),
                      Text(textAnswer),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
