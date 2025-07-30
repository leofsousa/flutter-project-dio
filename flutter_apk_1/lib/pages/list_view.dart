import 'package:flutter/material.dart';
import 'package:flutter_apk_1/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.userf),
          title: const Text("Usuário Feminino"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Olá, tudo bem?"), Text("10:10")],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "opcao1", child: Text("Opção 1")),
                const PopupMenuItem<String>(
                    value: "opcao2", child: Text("Opção 2")),
                const PopupMenuItem<String>(
                    value: "opcao3", child: Text("Opção 3")),
              ];
            },
          ),
        ),
        Image.asset(AppImages.userm),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3),
      ],
    );
  }
}
