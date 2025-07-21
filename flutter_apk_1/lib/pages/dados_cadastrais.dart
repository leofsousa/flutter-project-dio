import 'package:flutter/material.dart';
import 'package:flutter_apk_1/repositories/linguagens_repository.dart';
import 'package:flutter_apk_1/repositories/nivel_repository.dart';
import 'package:flutter_apk_1/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: '');
  var dataNacimentoController = TextEditingController(text: '');
  DateTime? dataNacimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i < quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(value: i, child: Text(i.toString())));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ListView(
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            const TextLabel(
              texto: "Data de Nascimento",
            ),
            TextField(
              controller: dataNacimentoController,
              readOnly: true,
              onTap: () async {
                var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime(2023, 10, 20));
                if (data != null) {
                  dataNacimentoController.text = data.toString();
                  dataNacimento = data;
                }
              },
            ),
            const TextLabel(texto: "Nível de Experiência"),
            Column(
              children: niveis
                  .map((nivel) => RadioListTile(
                      title: Text(nivel.toString()),
                      selected: nivelSelecionado == nivel,
                      value: nivel.toString(),
                      groupValue: nivelSelecionado,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          nivelSelecionado = value.toString();
                        });
                      }))
                  .toList(),
            ),
            const TextLabel(texto: "Linguagens preferidas"),
            Column(
              children: linguagens
                  .map((linguagem) => CheckboxListTile(
                      title: Text(linguagem),
                      value: linguagensSelecionadas.contains(linguagem),
                      onChanged: (bool? value) {
                        if (value!) {
                          setState(() {
                            linguagensSelecionadas.add(linguagem);
                          });
                        } else {
                          setState(() {
                            linguagensSelecionadas.remove(linguagem);
                          });
                        }
                      }))
                  .toList(),
            ),
            const TextLabel(texto: "Tempo de Experiência. (Em Anos)"),
            DropdownButton(
                value: tempoExperiencia,
                isExpanded: true,
                items: returnItens(50),
                onChanged: (value) {
                  setState(() {
                    tempoExperiencia = int.parse(value.toString());
                  });
                }),
            TextLabel(
                texto:
                    "Pretenção Salarial: R\$ ${salarioEscolhido.round().toString()}"),
            Slider(
                min: 0,
                max: 10000,
                value: salarioEscolhido,
                onChanged: (double value) {
                  setState(() {
                    salarioEscolhido = value;
                  });
                }),
            TextButton(
                onPressed: () {
                  print(nomeController.text);
                  print(dataNacimento);
                  print(nivelSelecionado);
                  print(linguagensSelecionadas);
                  print(tempoExperiencia);
                  print(salarioEscolhido.round());
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
