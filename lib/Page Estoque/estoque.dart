import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Page%20Estoque/blocos/bloco1.dart';

import 'blocos/bloco2.dart';

class Estoque extends StatefulWidget {
  const Estoque({Key? key}) : super(key: key);

  @override
  State<Estoque> createState() => _EstoqueState();
}

class _EstoqueState extends State<Estoque> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff01B47C),
        body: Column(
          children: [
            Bloco1(),
            Bloco2(),
          ],
        ),
      ),
    );
  }
}
