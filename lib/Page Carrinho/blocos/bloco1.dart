import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bloco1 extends StatefulWidget {
  const Bloco1({Key? key}) : super(key: key);

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
      alignment: Alignment.center,
      child: AutoSizeText(
        'Carrinho',
        style: TextStyle(fontSize: 35, color: Colors.white),
      ),
    );
  }
}
