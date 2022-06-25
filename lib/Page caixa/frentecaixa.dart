import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page%20caixa/blocos/bloco1.dart';
import 'package:flutter_application_1/Page%20caixa/blocos/bloco2.dart';

class FrenteCaixa extends StatefulWidget {
  const FrenteCaixa({Key? key}) : super(key: key);

  @override
  State<FrenteCaixa> createState() => _FrenteCaixaState();
}

class _FrenteCaixaState extends State<FrenteCaixa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
