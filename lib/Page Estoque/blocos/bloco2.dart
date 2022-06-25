import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Banco%20de%20dados/CRUD.dart';
import 'package:flutter_application_1/Page%20criacao/edite.dart';

class Bloco2 extends StatefulWidget {
  const Bloco2({Key? key}) : super(key: key);

  @override
  State<Bloco2> createState() => _Bloco2State();
}

class _Bloco2State extends State<Bloco2> {
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
            alignment: Alignment.center,
            //===========================================
            //          Titulo Box - text
            child: AutoSizeText(
              'Estoque',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: alturaBox * 0.87,
            //========================================================
            //                Future Builder
            //              Gerador de Itens
            child: FutureBuilder(
                future: BuscarDados(),
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
                            textDescricao: data[index]['descricao'],
                            qtdProduto: data[index]['quantidade'],
                            valorProduto: data[index]['valor'],
                            id: data[index]['id'],
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
        ],
      ),
    );
  }
}

class ItemProdut extends StatelessWidget {
  var alturaBox;
  var largura;
  var nomeProduto;
  var textDescricao;
  var valorProduto;
  var qtdProduto;
  int? id;
  ItemProdut({
    Key? key,
    this.id,
    this.alturaBox,
    this.largura,
    this.nomeProduto,
    this.textDescricao,
    this.valorProduto,
    this.qtdProduto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => Edite(
                  Nome: nomeProduto,
                  Descricao: textDescricao,
                  Quantidade: qtdProduto,
                  Valor: valorProduto,
                  id: id,
                )));
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: alturaBox * 0.3,
          child: Column(
            children: [
              Expanded(
                  flex: 100,
                  child: Container(
                    alignment: Alignment(-0.8, 0),
                    child: AutoSizeText(
                      nomeProduto,
                      style: TextStyle(fontSize: 22),
                    ),
                  )),
              Expanded(
                  flex: 100,
                  child: Container(
                    width: largura / 1.2,
                    child: AutoSizeText('descrição: ' + textDescricao),
                  )),
              Expanded(
                  flex: 80,
                  child: Container(
                      child: Row(
                    children: [
                      Expanded(flex: 20, child: Container()),
                      Expanded(
                          flex: 50,
                          child: AutoSizeText('Valor: ' + valorProduto,
                              style: TextStyle(fontSize: 18))),
                      Expanded(
                          flex: 100,
                          child: AutoSizeText('Qtds: ' + qtdProduto,
                              style: TextStyle(fontSize: 18))),
                    ],
                  ))),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.all(Radius.circular(30.0)))),
    );
  }
}
