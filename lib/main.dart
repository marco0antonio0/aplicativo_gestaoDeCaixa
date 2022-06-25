import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page%20Carrinho%20Finalizado/final.dart';
import 'package:flutter_application_1/Page%20Carrinho/carrinho.dart';
import 'package:flutter_application_1/Page%20Estoque/estoque.dart';
import 'package:flutter_application_1/Page%20caixa/frentecaixa.dart';
import 'package:flutter_application_1/Page%20criacao/edite.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,routes: {
    '/estoque': (_) => Estoque(),
    '/edite': (_) => Edite(),
    '/caixa': (_) => FrenteCaixa(),
    '/carrinho': (_) => Carrinho(),
    '/final': (_) => Final(),
  }, home: Seletor()));
}

class Seletor extends StatefulWidget {
  const Seletor({Key? key}) : super(key: key);

  @override
  State<Seletor> createState() => _SeletorState();
}

class _SeletorState extends State<Seletor> {
  @override
  Widget build(BuildContext context) {
    return Estoque();
  }
}
