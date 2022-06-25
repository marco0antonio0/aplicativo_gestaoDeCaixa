import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Banco%20de%20dados/CRUD.dart';
import 'package:flutter_application_1/Page%20criacao/edite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bloco2 extends StatefulWidget {
  const Bloco2({Key? key}) : super(key: key);

  @override
  State<Bloco2> createState() => _Bloco2State();
}

class _Bloco2State extends State<Bloco2> {
  TextEditingController ControllerNome = TextEditingController();
  String nome = '';
  String descricao = '';
  String valor = '';
  String quantidadeVer = '';
  int quantidade = 0;
  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    double alturaBox = altura * 0.688;
    double alturaBoxInterno = alturaBox * 0.87;

    incrementador() async {
      if (double.parse(quantidadeVer) > quantidade) {
        quantidade = quantidade + 1;
      }
    }

    decrementador() {
      if (quantidade > 0) {
        quantidade = quantidade - 1;
      }
    }

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
              'Frente\nCaixa',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: alturaBox * 0.87,
            child: Column(
              children: [
                Container(
                  height: (alturaBoxInterno / 5) * (0.3),
                  alignment: Alignment(-0.85, 0.8),
                  //color: Colors.red.withOpacity(0.1),
                  child: Text(
                    'nome do produto',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                    height: (alturaBoxInterno / 5) * (1),
                    width: largura,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 100,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: TextField(
                                onChanged: (value) async {
                                  print('isso que ta escrito ==>> $value');
                                  nome = value;
                                  List dados =
                                      await BuscarUnicoDados(nome: nome);
                                  if (dados.length != 0) {
                                    setState(() {
                                      nome = dados[0]['nome'];
                                      descricao = dados[0]['descricao'];
                                      valor = dados[0]['valor'];
                                      quantidadeVer = dados[0]['quantidade'];
                                    });
                                  } else {
                                    if (nome.length != 0) {
                                      setState(() {
                                        nome = '';
                                        quantidade = 0;
                                        valor = '';
                                        quantidadeVer = '';
                                      });
                                    }
                                  }
                                },
                                controller: ControllerNome,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'digite')),
                          ),
                        ),
                      ],
                    )),
                Container(
                  height: (alturaBoxInterno / 5) * (1 + 0.8),
                  child: nome.length > 0
                      ? Dados1(
                          altura: altura,
                          largura: largura,
                          nome: nome,
                          descricao: descricao,
                          valor: valor,
                          quantidadeVer: quantidadeVer,
                        )
                      : Dados2(),
                ),
                Container(
                  height: ((alturaBoxInterno / 5) * (1)) - 20,
                  width: largura,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      //========================================
                      //            BTN ++++
                      Container(
                        width: (largura / 3) * (0.8 - 0.1),
                        height: ((alturaBoxInterno / 5) * (0.8)) - 20,
                        child: nome.length > 0
                            ? ElevatedButton(
                                onPressed: () async {
                                  try {
                                    var data1 = await BuscarUnicoDados(
                                        nome: nome, tbnome: 'carrinho');
                                    var total =
                                        int.parse(data1[0]['quantidade']);
                                    print(total);
                                    if (quantidade <
                                        (int.parse(quantidadeVer) - total)) {
                                      setState(() {
                                        incrementador();
                                      });
                                    }
                                  } catch (e) {
                                    setState(() {
                                      incrementador();
                                    });
                                  }
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black.withOpacity(0)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0)))))
                            : null,
                      ),
                      Spacer(),
                      //========================================
                      //            Visor
                      nome.length > 0
                          ? Container(
                              width: (largura / 3) * (1.4 - 0.1),
                              height: ((alturaBoxInterno / 5) * (0.8)) - 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(60.0))),
                              child: Text(
                                '$quantidade',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          : Container(),
                      Spacer(),
                      //========================================
                      //            BTN -----
                      Container(
                        width: (largura / 3) * (0.8 - 0.1),
                        height: ((alturaBoxInterno / 5) * (0.8)) - 20,
                        child: nome.length > 0
                            ? ElevatedButton(
                                onPressed: () {
                                  if (quantidade > 0 && nome.length > 0) {
                                    setState(() {
                                      decrementador();
                                    });
                                  }
                                },
                                child: Icon(FontAwesomeIcons.minus),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black.withOpacity(0)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0)))))
                            : null,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                  height: ((alturaBoxInterno / 5) * (0.9)) + 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      //========================================
                      //            BTN -- adicionar
                      Container(
                        width: (largura / 2) * 0.9,
                        child: Container(
                          height: ((alturaBoxInterno / 5) * (0.8)) - 20,
                          child: ElevatedButton(
                              onPressed: () async {
                                var data1 = await BuscarUnicoDados(
                                    nome: nome, tbnome: 'carrinho');
                                if (data1.length > 0) {
                                  AlterarDadosprloNome(
                                      nome: nome,
                                      tbnome: 'carrinho',
                                      quantidade: quantidade +
                                          int.parse(data1[0]['quantidade']));
                                  setState(() {
                                    nome = '';
                                    valor = '';
                                    quantidade = 0;
                                    ControllerNome.clear();
                                  });
                                } else {
                                  if (nome.length > 0 &&
                                      valor.length > 0 &&
                                      quantidade > 0) {
                                    inserirDadosSQLTBcarrinho(
                                        nome: nome,
                                        valor: valor,
                                        quantidade: quantidade);
                                    setState(() {
                                      nome = '';
                                      valor = '';
                                      quantidade = 0;
                                      ControllerNome.clear();
                                    });
                                  }
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Adicionar\t\t'),
                                  Icon(FontAwesomeIcons.cartPlus)
                                ],
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff01B47C)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0))))),
                        ),
                      ),
                      Spacer(),
                      //========================================
                      //            BTN -- Carrinho
                      Container(
                        width: (largura / 2) * 0.9,
                        child: Container(
                          height: ((alturaBoxInterno / 5) * (0.8)) - 20,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .popAndPushNamed('/carrinho');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Carrinho\t\t'),
                                  Icon(FontAwesomeIcons.shop)
                                ],
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff01B47C)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0))))),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dados1 extends StatelessWidget {
  var largura;
  var altura;
  String? valor;
  String? quantidadeVer;

  String? descricao;
  String? nome;
  Dados1(
      {Key? key,
      this.quantidadeVer,
      this.largura,
      this.altura,
      this.nome,
      this.descricao,
      this.valor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Expanded(
                flex: 70,
                child: Container(
                    alignment: Alignment(-0.8, 0),
                    child: Text(nome!, style: TextStyle(fontSize: 20)))),
            Expanded(
                flex: 100,
                child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.symmetric(horizontal: largura * 0.05),
                    child: Text(
                      'descrição: ' + descricao!,
                      textAlign: TextAlign.left,
                    ))),
            Expanded(
                flex: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        alignment: Alignment(-0.8, 0),
                        child: Text('Preço: ' + valor!,
                            style: TextStyle(fontSize: 19))),
                    Container(
                        alignment: Alignment(-0.8, 0),
                        child: Text('qtd disponivel: ' + quantidadeVer!,
                            style: TextStyle(fontSize: 19)))
                  ],
                )),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.all(Radius.circular(30.0))));
  }
}

class Dados2 extends StatelessWidget {
  var largura;
  var altura;
  Dados2({Key? key, this.largura, this.altura}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Digite algo para procurar\nNada enconntrado',
          textAlign: TextAlign.center),
    );
  }
}
