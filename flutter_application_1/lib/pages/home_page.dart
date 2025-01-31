import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;

int _gerarNumeroAleatorio() {
  Random numeroAleatorio = Random();
  return numeroAleatorio.nextInt(1000);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Olá"),
        backgroundColor: Colors.red,
      ),
      body: Center(child: Text(numeroGerado.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numeroGerado = _gerarNumeroAleatorio();
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add_box),
        ),
    );
   }
  }