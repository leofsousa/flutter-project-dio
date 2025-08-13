import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int numeroGerado = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Gerador de Números Aleatórios",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado.toString(),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.lightBlue,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
          onPressed: () async {
            final storage = await SharedPreferences.getInstance();
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
            });
            storage.setInt("numero_aleatorio", numeroGerado);

            var numero = storage.getInt("numero_aleatorio");
            debugPrint(numero.toString());
          },
        ),
      ),
    );
  }
}
