import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page%20criacao/blocos/bloco1.dart';

import 'blocos/bloco2.dart';

class Edite extends StatefulWidget {
  String? Nome = '';
  String? Descricao = '';
  String? Quantidade = '';
  String? Valor = '';
  int? id;
  Edite(
      {Key? key,
      this.id,
      this.Nome,
      this.Descricao,
      this.Quantidade,
      this.Valor})
      : super(key: key);

  @override
  State<Edite> createState() => _EditeState(
      Nome: Nome,
      Descricao: Descricao,
      Quantidade: Quantidade,
      Valor: Valor,
      id: id);
}

class _EditeState extends State<Edite> {
  _EditeState(
      {this.id, this.Nome, this.Descricao, this.Quantidade, this.Valor});
  @override
  String? Nome = '';
  String? Descricao = '';
  String? Quantidade = '';
  String? Valor = '';
  int? id;
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popAndPushNamed('/estoque');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff01B47C),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Bloco1(),
                  Bloco2(
                    Nome: Nome,
                    Descricao: Descricao,
                    Quantidade: Quantidade,
                    Valor: Valor,
                    id: id,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
