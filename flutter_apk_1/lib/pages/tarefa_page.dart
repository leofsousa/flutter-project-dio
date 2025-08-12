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
  var apenasNaoConcluidos = false;

  var _tarefas = <Tarefa>[];

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if (apenasNaoConcluidos == true) {
      _tarefas = await tarefaRepository.listarNaoConcluida();
    } else {
      _tarefas = await tarefaRepository.listar();
    }
    setState(() {});
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filtrar Apenas Não concluidas",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Switch(
                      value: apenasNaoConcluidos,
                      onChanged: (bool value) {
                        apenasNaoConcluidos = value;
                        obterTarefas();
                      })
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      confirmDismiss: (direction) async {
                        bool? confirmar = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Confirmar exclusão"),
                                content: Text(
                                    "Deseja realmente excluir a tarefa '${tarefa.getDescricao()}'"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: const Text("Cancelar")),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, true);
                                      },
                                      child: const Text("Confimar"))
                                ],
                              );
                            });
                        return confirmar ?? false;
                      },
                      onDismissed: (DismissDirection dismissDirection) async {
                        await tarefaRepository.remove(tarefa.getId());
                        obterTarefas();
                      },
                      key: Key(tarefa.getId()),
                      child: ListTile(
                          title: Text(tarefa.getDescricao()),
                          trailing: Switch(
                              value: tarefa.getConcluido(),
                              onChanged: (bool value) async {
                                await tarefaRepository.alterar(
                                    tarefa.getId(), value);
                                obterTarefas();
                              })),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
