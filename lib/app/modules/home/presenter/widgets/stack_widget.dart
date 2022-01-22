import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StackWidget extends StatelessWidget {
  final Color color;
  final String text;

  const StackWidget({Key key, @required this.color, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: color,
          height: 100,
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              color: Colors.deepPurpleAccent,
              elevation: 7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('Questionário',
                            style:
                                TextStyle(fontSize: 24, color: Colors.white)),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(FontAwesomeIcons.list, color: Colors.white),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(text,
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
