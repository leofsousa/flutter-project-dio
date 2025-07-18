import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Dados'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            const SizedBox(
              height: 10,
            ),
            const TextLabel(texto: "Data de Nascimento",)
            ,
            TextField(
              controller: dataNacimentoController,
              readOnly: true,
              onTap: () async {
                var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime(2023, 10, 20));
                if(data != null){
                  dataNacimentoController.text = data.toString();
                  dataNacimento = data;
                };
              },
            ),
            TextButton(
                onPressed: () {
                  print(nomeController.text);
                  print(dataNacimento);
                },
                child: const Text("Salvar"))
          ],
        ),
      ),
    );
  }
}
