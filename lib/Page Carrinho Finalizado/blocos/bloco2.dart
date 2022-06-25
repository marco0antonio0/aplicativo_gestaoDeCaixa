import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  // ValueNotifier<String> valorTotal = ValueNotifier<String>('');]

  var troco;
  TextEditingController controllerTroco = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String valorTotal = '';
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    double alturaBox = altura * 0.688;
    ValueNotifier<double> vtotal = ValueNotifier(0.0);
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
            //          Titulo Box - text
          ),
          Container(
            height: (alturaBox * 0.87) * 0.8,
            // color: Colors.red,
            child: Column(
              children: [
                Expanded(
                    flex: 50,
                    child: Container(
                        // color: Colors.red,
                        )),
                Expanded(
                    flex: 150,
                    child: Container(
                      // color: Colors.blue,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 10,
                            child: Align(
                                alignment: Alignment(-0.8, 0),
                                child: FutureBuilder(
                                    future: BuscarDados(tbnome: 'carrinho'),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.data.length > 0) {
                                          List data = snapshot.data;
                                          var valor = 0.0;
                                          for (var i = 0;
                                              i < (data.length);
                                              i++) {
                                            valor = valor +
                                                (double.parse(
                                                        data[i]['quantidade']) *
                                                    double.parse(
                                                        data[i]['valor']));
                                          }
                                          return Text(
                                            'Valor total: ' + '$valor',
                                            style: TextStyle(fontSize: 30),
                                          );
                                        }
                                      }
                                      return Text(
                                        'Valor total: ' + valorTotal,
                                        style: TextStyle(fontSize: 30),
                                      );
                                    })),
                          ),
                          Expanded(
                            flex: 10,
                            child: Align(
                              alignment: Alignment(-0.8, 0),
                              child: Text(
                                'Valor Recebido',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 100,
                    child: Container(
                      // color: Colors.red,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                          onChanged: (value) async {
                            List data = await BuscarDados(tbnome: 'carrinho');
                            var valor = 0.0;
                            for (var i = 0; i < (data.length); i++) {
                              valor = valor +
                                  (double.parse(data[i]['quantidade']) *
                                      double.parse(data[i]['valor']));
                            }

                            try {
                              if (controllerTroco.text.length > 0) {
                                var v = double.parse(controllerTroco.text);
                                if (v >= valor) {
                                  setState(() {
                                    troco = v - valor;
                                  });
                                } else {
                                  setState(() {
                                    troco =
                                        'Valor recebido menor que o valor total';
                                  });
                                }
                              }
                            } catch (e) {
                              if (controllerTroco.text.length > 0) {
                                setState(() {
                                  troco = 'ola';
                                });
                              }
                            }
                          },
                          controller: controllerTroco,
                          maxLength: 5,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'digite')),
                    )),
                Expanded(flex: 50, child: Container()),
                Expanded(
                    flex: 100,
                    child: Container(
                      // color: Colors.red,
                      alignment: Alignment(-0.5, 0),
                      child: Text(
                        'Troco: ' + '$troco',
                        style: TextStyle(fontSize: 19),
                      ),

                      /*    */
                    )),
                Expanded(flex: 50, child: Container()),
              ],
            ),
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
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff01B47C)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)))),
                      onPressed: () async {
                        var data1 = await BuscarDados(tbnome: 'carrinho');

                        for (var i = 0; i < data1.length; i++) {
                          var name = data1[i]['nome'];
                          var data2 = await BuscarUnicoDados(
                              tbnome: 'produto', nome: name);
                          AlterarDadosprloNome(
                              tbnome: 'produto',
                              nome: data1[i]['nome'],
                              quantidade: (int.parse(data2[0]['quantidade']) -
                                      int.parse(data1[i]['quantidade']))
                                  .toString());
                        }
                        deletetodosDados('carrinho');
                        Navigator.of(context).popAndPushNamed('/caixa');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Finalizar\t\t'),
                          Icon(FontAwesomeIcons.arrowRightLong),
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
