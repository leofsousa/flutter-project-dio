import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPage();
}

class _CardPage extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: Card(
            elevation: 8,
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.network(
                        "https://c5gwmsmjx1.execute-api.us-east-1.amazonaws.com/prod/dados_processo_seletivo/logo_empresa/119818/LOGO-DIO-COLOR.png_name_20221031-2831-ekn5hh.png",
                        height: 20,
                      ),
                      const Text(
                        "Meu Card",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "O cuidado em identificar pontos críticos na necessidade de renovação processual impulsiona o reposicionamento institucional das posturas dos órgãos dirigentes com relação às suas atribuições. Ainda assim, existem dúvidas a respeito de como a execução dos pontos do programa impõe uma reinterpretação dos vínculos sociais dos índices pretendidos. À luz das boas práticas institucionais, o aumento do diálogo entre os diferentes setores produtivos causa impacto indireto na reavaliação de alternativas às soluções ortodoxas. Sob essa perspectiva, a percepção das dificuldades ressalta a relevância da participação ativa das condições financeiras e administrativas exigidas",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,
                  ),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.bottomRight,
                      child:
                          TextButton(onPressed: () {}, child: const Text("Ler Mais",
                          style: TextStyle(decoration: TextDecoration.underline),)))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
