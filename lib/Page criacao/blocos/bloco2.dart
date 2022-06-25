import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Banco%20de%20dados/CRUD.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class Bloco2 extends StatefulWidget {
  String? Nome = '';
  String? Descricao = '';
  String? Quantidade = '';
  String? Valor = '';
  int? id;
  Bloco2(
      {Key? key,
      this.id,
      this.Nome,
      this.Descricao,
      this.Quantidade,
      this.Valor})
      : super(key: key);

  @override
  State<Bloco2> createState() => _Bloco2State(
      id: id,
      Nome: Nome,
      Descricao: Descricao,
      Quantidade: Quantidade,
      Valor: Valor);
}

class _Bloco2State extends State<Bloco2> {
  _Bloco2State(
      {this.id, this.Nome, this.Descricao, this.Quantidade, this.Valor});
  final formKey = GlobalKey<FormState>();
  TextEditingController ControllerNome = TextEditingController();
  TextEditingController ControllerDescricao = TextEditingController();
  TextEditingController ControllerQuantidade = TextEditingController();
  TextEditingController ControllerValor = TextEditingController();

  String? Nome = '';
  String? Descricao = '';
  String? Quantidade = '';
  String? Valor = '';
  int? id;
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    double alturaBox = altura * 0.688;

    return Container(
        height: alturaBox,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(60.0),
                topLeft: Radius.circular(60.0))),
        alignment: Alignment.center,
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  height: alturaBox * 0.13,
                  alignment: Alignment(-0.8, 0),
                  //===========================================
                  //          BTN - Voltar
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).popAndPushNamed('/estoque');
                    },
                    icon: Icon(
                      FontAwesomeIcons.circleChevronLeft,
                      color: Colors.black.withOpacity(0.5),
                      size: 50,
                      shadows: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  //===========================================
                  //          Titulo Box - text
                ),
                Container(
                  height: alturaBox * 0.87,
                  child: Column(
                    children: [
                      //=============================================
                      //          campo -- NOME
                      Expanded(
                          flex: 100,
                          child: Container(
                              child: Row(children: [
                            Expanded(
                                flex: 50,
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 10),
                                    child: AutoSizeText('Nome : ',
                                        style: TextStyle(fontSize: 19)))),
                            Expanded(
                                flex: 100,
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: TextFormField(
                                        maxLength: 20,
                                        controller: ControllerNome,
                                        validator: (value) {
                                          if (value!.length == 0) {
                                            return 'campo vazio';
                                          }
                                          if (value.length <= 1) {
                                            return 'nome curto';
                                          }
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: Nome!.length != 0
                                                ? Nome
                                                : 'digite')))),
                          ]))),
                      //=============================================
                      //          campo -- DESCRIÇÃO
                      Expanded(
                          flex: 250,
                          child: Container(
                              child: Row(children: [
                            Expanded(
                                flex: 50,
                                child: Container(
                                    alignment: Alignment(0, -0.5),
                                    margin: EdgeInsets.only(left: 10),
                                    child: AutoSizeText('Descrição : ',
                                        style: TextStyle(fontSize: 19)))),
                            Expanded(
                                flex: 100,
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value!.length == 0) {
                                            return 'campo vazio';
                                          }
                                          if (value.length >= 500) {
                                            return 'Descrição excedeu 500 caracter';
                                          }
                                        },
                                        controller: ControllerDescricao,
                                        maxLength: 500,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: Descricao!.length != 0
                                                ? Descricao
                                                : 'digite')))),
                          ]))),
                      //=============================================
                      //          campo -- QTDS
                      Expanded(
                          flex: 100,
                          child: Container(
                              child: Row(children: [
                            Expanded(
                                flex: 50,
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 10),
                                    child: AutoSizeText('Quantidade : ',
                                        style: TextStyle(fontSize: 19)))),
                            Expanded(
                                flex: 100,
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value!.length == 0)
                                            return 'campo vazio';
                                        },
                                        maxLength: 5,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: ControllerQuantidade,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: Quantidade!.length != 0
                                                ? Quantidade
                                                : 'digite')))),
                          ]))),
                      //=============================================
                      //          campo -- VALOR
                      Expanded(
                          flex: 100,
                          child: Container(
                              child: Row(children: [
                            Expanded(
                                flex: 50,
                                child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(left: 10),
                                    child: AutoSizeText('Valor : ',
                                        style: TextStyle(fontSize: 19)))),
                            Expanded(
                                flex: 100,
                                child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value!.length == 0)
                                            return 'campo vazio';
                                        },
                                        maxLength: 5,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]')),
                                        ],
                                        keyboardType: TextInputType.number,
                                        controller: ControllerValor,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: Valor!.length != 0
                                                ? Valor
                                                : 'digite')))),
                          ]))),
                      //=============================================
                      //          BTN confirmar - delete
                      Flexible(
                          flex: 200,
                          child: Container(
                              alignment: Alignment.center,
                              child: Container(
                                  height: altura * 0.2,
                                  //color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Spacer(),
                                      BtnConfirmar(
                                        largura: largura,
                                        altura: altura,
                                        ControllerDescricao:
                                            ControllerDescricao,
                                        ControllerNome: ControllerNome,
                                        ControllerQuantidade:
                                            ControllerQuantidade,
                                        ControllerValor: ControllerValor,
                                        formKey: formKey,
                                        Nome: Nome,
                                        Descricao: Descricao,
                                        Quantidade: Quantidade,
                                        Valor: Valor,
                                        id: id,
                                        cor: Color(0xff01B47C),
                                        tituloBtn: 'Confirmar',
                                        icon: FontAwesomeIcons.circleCheck,
                                        escolha: 1,
                                      ),
                                      Spacer(),
                                      if (Nome!.length > 0)
                                        BtnConfirmar(
                                          largura: largura,
                                          altura: altura,
                                          ControllerDescricao:
                                              ControllerDescricao,
                                          ControllerNome: ControllerNome,
                                          ControllerQuantidade:
                                              ControllerQuantidade,
                                          ControllerValor: ControllerValor,
                                          formKey: formKey,
                                          Nome: Nome,
                                          Descricao: Descricao,
                                          Quantidade: Quantidade,
                                          Valor: Valor,
                                          id: id,
                                          cor: Colors.red,
                                          tituloBtn: 'Excluir',
                                          icon: FontAwesomeIcons.trash,
                                          escolha: 2,
                                        ),
                                      if (Nome!.length > 0) Spacer(),
                                    ],
                                  )))),
                    ],
                  ),
                ),
              ],
            )));
  }
}

class BtnConfirmar extends StatelessWidget {
  var formKey;
  var Nome;
  var Descricao;
  var Quantidade;
  var Valor;
  var largura;
  var altura;
  var id;
  var ControllerNome;
  var ControllerDescricao;
  var ControllerQuantidade;
  var ControllerValor;
  var cor;
  var tituloBtn;
  var icon;
  var escolha;
  BtnConfirmar(
      {Key? key,
      this.escolha,
      this.icon,
      this.cor,
      this.tituloBtn,
      this.largura,
      this.altura,
      this.ControllerNome,
      this.ControllerDescricao,
      this.ControllerQuantidade,
      this.ControllerValor,
      this.formKey,
      this.id,
      this.Nome,
      this.Descricao,
      this.Quantidade,
      this.Valor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: altura! * 0.1,
      width: largura! / 2.2,
      child: ElevatedButton(
          onPressed: () async {
            var status = formKey.currentState?.validate();
            if (escolha == 1) {
              if (status! || Nome!.length > 0) {
                if (Nome!.length > 0 || Descricao!.length > 0) {
                  AlterarDados(
                    id: id,
                    nome: ControllerNome.text.length > 0
                        ? ControllerNome.text
                        : Nome,
                    descricao: ControllerDescricao.text.length > 0
                        ? ControllerDescricao.text
                        : Descricao,
                    quantidade: ControllerQuantidade.text.length > 0
                        ? ControllerQuantidade.text
                        : Quantidade,
                    valor: ControllerValor.text.length > 0
                        ? ControllerValor.text
                        : Valor,
                  );
                } else {
                  if (status) {
                    inserirDadosSQL(
                      nome: ControllerNome.text,
                      descricao: ControllerDescricao.text,
                      quantidade: ControllerQuantidade.text,
                      valor: ControllerValor.text,
                    );
                  }
                }
                Navigator.of(context).popAndPushNamed('/estoque');
              }
            }
            if (escolha == 2) {
              deleteDados(id);
              Navigator.of(context).popAndPushNamed('/estoque');
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                tituloBtn,
                style: TextStyle(fontSize: 18),
              ),
              Container(margin: EdgeInsets.only(left: 10), child: Icon(icon)),
            ],
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(cor),
              shadowColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0))))),
    );
  }
}
