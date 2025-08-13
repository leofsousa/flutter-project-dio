import 'package:flutter/material.dart';
import 'package:flutter_apk_1/pages/dados_cadastrais.dart';
import 'package:flutter_apk_1/pages/login_page.dart';
import 'package:flutter_apk_1/pages/numeros_aleatorios_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Câmera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          leading: const Icon(Icons.album),
                          title: const Text("Galeria"),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                currentAccountPicture: CircleAvatar(
                  child: Image.network(
                      "https://c5gwmsmjx1.execute-api.us-east-1.amazonaws.com/prod/dados_processo_seletivo/logo_empresa/119818/LOGO-DIO-COLOR.png_name_20221031-2831-ekn5hh.png"),
                ),
                accountName: const Text("Leonardo Sousa"),
                accountEmail: const Text("email@email.com")),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Dados Cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastraisPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Termos de Uso e Privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Termos de Uso e Privacidade",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "Levando em consideração as tendências globais, o surgimento do comércio virtual talvez venha a ressaltar a relatividade da governabilidade em ambientes voláteis. O incentivo ao avanço tecnológico, assim como a estrutura atual da organização demanda um esforço conjunto de alinhamento das diretrizes de desenvolvimento para o futuro. Percebemos, cada vez mais, que a competitividade nas transações comerciais ilustra as tensões entre tradição e inovação das posturas dos órgãos dirigentes com relação às suas atribuições. No escopo da atual conjuntura, a contínua expansão de nossa atividade garante a contribuição de um grupo importante na determinação dos processos que moldam a realidade institucional.",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.casino),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Gerador de Números"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const NumerosAleatoriosPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: const Text(
                        "Meu App",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(children: [
                        Text(
                          "Você sairá do aplicativo!",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Deseja Realmente Sair do Aplicativo?"),
                      ]),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Não')),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text('Sim'))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
