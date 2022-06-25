import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page%20Carrinho%20Finalizado/blocos/bloco1.dart';
import 'package:flutter_application_1/Page%20Carrinho%20Finalizado/blocos/bloco2.dart';

class Final extends StatefulWidget {
  const Final({Key? key}) : super(key: key);

  @override
  State<Final> createState() => _FinalState();
}

class _FinalState extends State<Final> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigator.of(context).popAndPushNamed('/caixa');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff01B47C),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Bloco1(),
                Bloco2(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
