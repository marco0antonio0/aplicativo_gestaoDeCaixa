import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Banco%20de%20dados/CRUD.dart';
import 'package:flutter_application_1/Page%20criacao/edite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bloco2 extends StatefulWidget {
  const Bloco2({Key? key}) : super(key: key);

  @override
  State<Bloco2> createState() => _Bloco2State();
}

class _Bloco2State extends State<Bloco2> {
  ValueNotifier<String> valorTotal = ValueNotifier<String>('');
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
              topRight: Radius.circular(60.0), topLeft: Radius.circular(60.0))),
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            height: alturaBox * 0.13,
            alignment: Alignment(-0.8, 0),
            //===========================================
            //          BTN - Voltar
            child: IconButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/caixa');
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
            height: (alturaBox * 0.87) * 0.8,
            // color: Colors.red,
            //========================================================
            //                Future Builder
            //              Gerador de Itens
            child: FutureBuilder(
                future: BuscarDados(tbnome: 'carrinho'),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    List<Map<String, dynamic>> data = snapshot.data;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return ItemProdut(
                            alturaBox: alturaBox,
                            largura: largura,
                            nomeProduto: data[index]['nome'],
                            qtdProduto: data[index]['quantidade'],
                            valorProduto: data[index]['valor'],
                            id: data[index]['id'],
                            // valorTotal: valorTotal,
                          );
                        });
                  }
                  return ListView.builder(
                      itemCount: 0,
                      itemBuilder: (__, index) {
                        return ItemProdut(
                          alturaBox: alturaBox,
                          largura: largura,
                        );
                      });
                }),
          ),
          Container(
            height: (alturaBox * 0.87) * 0.2,
            child: Row(
              children: [
                Container(
                  height: (alturaBox * 0.87) * 0.2,
                  width: largura / 2.1,
                  alignment: Alignment.center,
                ),
                Container(
                    width: largura / 2.1,
                    height: ((alturaBox * 0.87) * 0.15),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)))),
                      onPressed: () async {
                        List data = await BuscarDados(tbnome: 'carrinho');
                        if (data.length > 0) {
                          Navigator.of(context).popAndPushNamed('/final');
                        }
                      },
                      child: Row(
                        children: [
                          Text('fechar compra\t\t'),
                          Icon(FontAwesomeIcons.shop),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemProdut extends StatefulWidget {
  var alturaBox;
  var largura;
  var nomeProduto;
  var valorProduto;
  var qtdProduto;
  // var valorTotal;
  int? id;
  int? quantidade;
  ItemProdut({
    Key? key,
    // this.valorTotal,
    this.quantidade,
    this.id,
    this.alturaBox,
    this.largura,
    this.nomeProduto,
    this.valorProduto,
    this.qtdProduto,
  }) : super(key: key);

  @override
  State<ItemProdut> createState() => _ItemProdutState(
        quantidade: quantidade,
        id: id,
        alturaBox: alturaBox,
        largura: largura,
        nomeProduto: nomeProduto,
        valorProduto: valorProduto,
        qtdProduto: qtdProduto,
      );
}

class _ItemProdutState extends State<ItemProdut> {
  var quantidade;
  var id;
  var alturaBox;
  var largura;
  var nomeProduto;
  var valorProduto;
  var qtdProduto;
  // var valorTotal;
  _ItemProdutState({
    // this.valorTotal,
    this.quantidade,
    this.id,
    this.alturaBox,
    this.largura,
    this.nomeProduto,
    this.valorProduto,
    this.qtdProduto,
  });

  @override
  Widget build(BuildContext context) {
    incremente() async {
      var data1 = await BuscarUnicoDados(
        nome: nomeProduto,
      );
      int qtd = int.parse(qtdProduto);
      if (int.parse(data1[0]['quantidade']) > qtd) {
        if (qtd >= 0) {
          qtd = qtd + 1;
          String qtd1 = (qtd).toString();
          AlterarDados(tbnome: 'carrinho', id: widget.id, quantidade: qtd1);
          qtdProduto = qtd1;
        }
      }
    }

    decremente() {
      int qtd = int.parse(qtdProduto);
      if (qtd > 0) {
        qtd = qtd - 1;
        String qtd1 = (qtd).toString();
        AlterarDados(tbnome: 'carrinho', id: widget.id, quantidade: qtd1);
        qtdProduto = qtd1;
      }
    }

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: widget.alturaBox * 0.1,
        child: Row(
          children: [
            Expanded(
                flex: 100,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                          flex: 100,
                          child: Container(
                              alignment: Alignment(-0.35, 0),
                              child: AutoSizeText(widget.nomeProduto,
                                  style: TextStyle(fontSize: 22)))),
                      Expanded(
                          flex: 80,
                          child: Container(
                            alignment: Alignment(0, 0),
                            child: AutoSizeText(
                                'Valor: ' +
                                    '${double.parse(valorProduto) * double.parse(qtdProduto)}',
                                style: TextStyle(fontSize: 18)),
                          )),
                    ],
                  ),
                )),
            Expanded(
                flex: 100,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                          flex: 100,
                          child: Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    incremente();
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.green),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0))))),
                          )),
                      Expanded(
                          flex: 100,
                          child: Container(
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              '$qtdProduto',
                              style: TextStyle(fontSize: 19),
                            ),
                          )),
                      Expanded(
                          flex: 100,
                          child: Container(
                            child: ElevatedButton(
                                onPressed: () {
                                  int qtd = int.parse(widget.qtdProduto);
                                  if (qtd > 0) {
                                    qtd = qtd - 1;
                                    String qtd1 = (qtd).toString();
                                    AlterarDados(
                                        tbnome: 'carrinho',
                                        id: widget.id,
                                        quantidade: qtd1);
                                    setState(() {
                                      setState(() {
                                        decremente();
                                      });
                                    });
                                  }
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0))))),
                          ))
                    ],
                  ),
                )),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.all(Radius.circular(30.0))));
  }
}


/* */