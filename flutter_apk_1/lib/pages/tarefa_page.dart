import 'package:flutter/material.dart';
import 'package:flutter_apk_1/model/tarefa.dart';
import 'package:flutter_apk_1/repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var descricaoController = TextEditingController();
  var tarefaRepository = TarefaRepository();

  var _tarefas = <Tarefa>[];

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    _tarefas = await tarefaRepository.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                      onPressed: () {
                        tarefaRepository
                            .adicionat(
                          Tarefa(descricaoController.text, false),
                        )
                            .then((_) {
                          setState(() {
                            obterTarefas();
                          });
                        });
                        Navigator.pop(context);
                      },
                      child: const Text("Salvar"),
                    )
                  ],
                );
              });
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
            itemCount: _tarefas.length,
            itemBuilder: (BuildContext bc, int index) {
              var tarefa = _tarefas[index];
              return ListTile(
                title: Text(tarefa.getDescricao()),
              );
            }),
      ),
    );
  }
}
