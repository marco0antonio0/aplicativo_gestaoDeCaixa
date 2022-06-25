import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page%20criacao/edite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bloco1 extends StatefulWidget {
  var dados;
  Bloco1({Key? key, this.dados}) : super(key: key);

  @override
  State<Bloco1> createState() => _Bloco1State();
}

class _Bloco1State extends State<Bloco1> {
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    return Container(
        height: altura * 0.25,
        child: Column(
          children: [
            //======================================================
            //                BTN titulos
            Container(
              margin: EdgeInsets.only(top: largura * 0.1),
              // color: Colors.yellow,
              height: altura * 0.1,
              width: largura * 0.9,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Container(
                      //color: Colors.red,
                      width: largura / 2.3,
                      //======================================
                      //            BTN estoque
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed('/estoque');
                          },
                          child: AutoSizeText('Estoque',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 25)))),
                  Spacer(),
                  Container(
                      //color: Colors.red,
                      width: largura / 2.3,
                      //======================================
                      //            BTN Frente Caixa
                      child: TextButton(
                          onPressed: () {},
                          child: AutoSizeText('Frente Caixa',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(1),
                                  fontSize: 25)))),
                  Spacer(),
                ],
              ),
            ),

            Align(
                alignment: Alignment(0.8, 0),
                child: Container(
                  // color: Colors.blue,
                  width: largura * 0.4,
                  height: altura * 0.08,
                ))
          ],
        ));
  }
}
