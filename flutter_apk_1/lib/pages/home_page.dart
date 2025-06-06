import 'package:flutter/material.dart';

import '../service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var numeroGerado = 0;
  var quantidadeCliques = 0;

  

  @override
  Widget build(BuildContext context) {
    debugPrint('Chamando Método Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App'),
        ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Ações do Usuário"),
            Text("Foi clicado: $quantidadeCliques vezes"),
            Text("O número gerado foi: $numeroGerado "),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          setState(() {
            quantidadeCliques = quantidadeCliques + 1;
            numeroGerado = GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
          });
        }
        ),
    );
  }
}