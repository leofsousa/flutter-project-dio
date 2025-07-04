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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.cyan,
              child: 
                const Text("Ações do Usuário")),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.orange,
                child: 
                  Text("Foi clicado: $quantidadeCliques vezes")),
            ),
            Container(
              width: double.infinity,
              color: Colors.indigo ,
              child: 
                Text("O número gerado foi: $numeroGerado ")),
            Expanded(
              child: Container(
                color: Colors.grey ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.red,
                        child: const Text("Nome: ")),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.blue,
                        child: const Text("Leonardo Felipe de Sousa")),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.green,
                        child: const Text("26")),
                    )
                  ],),
              ),
            )
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