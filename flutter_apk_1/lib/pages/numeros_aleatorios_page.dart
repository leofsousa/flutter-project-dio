import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado = 0;
  int? quantidadeCliques;
  final CHAVE_NUMERO_GERADO = "numero_aleatorio";
  final CHAVE_QUANTIDADE_CLIQUES = "quantidade_cliques";
  late SharedPreferences storage;

  void _carregarNumeroGerado() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_GERADO);
      quantidadeCliques == storage.getInt(CHAVE_QUANTIDADE_CLIQUES);
    });
  }

  @override
  void initState() {
    _carregarNumeroGerado();
    super.initState();
  }

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
                numeroGerado == null ? "" : numeroGerado.toString(),
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Text(
                quantidadeCliques == null
                    ? "Nenhum número gerado"
                    : "Quantidade de cliques: ${quantidadeCliques.toString()}",
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
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeCliques = (quantidadeCliques ?? 0) + 1;
            });
            storage.setInt(CHAVE_NUMERO_GERADO, numeroGerado!);
            storage.setInt(CHAVE_QUANTIDADE_CLIQUES, quantidadeCliques!);
          },
        ),
      ),
    );
  }
}
