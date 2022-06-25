import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page%20Carrinho/blocos/bloco1.dart';
import 'package:flutter_application_1/Page%20Carrinho/blocos/bloco2.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({Key? key}) : super(key: key);

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popAndPushNamed('/caixa');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff01B47C),
          body: Column(
            children: [
              Bloco1(),
              Bloco2(),
            ],
          ),
        ),
      ),
    );
  }
}
