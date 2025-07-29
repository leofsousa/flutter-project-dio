import 'package:flutter_apk_1/model/card_detail.dart';

class CardDetailRepository {

  Future<CardDetail> get() async {
    await Future.delayed(const  Duration(seconds: 3));
    return CardDetail(
      1,
      "Meu Card",
      "https://c5gwmsmjx1.execute-api.us-east-1.amazonaws.com/prod/dados_processo_seletivo/logo_empresa/119818/LOGO-DIO-COLOR.png_name_20221031-2831-ekn5hh.png",
      "O cuidado em identificar pontos críticos na necessidade de renovação processual impulsiona o reposicionamento institucional das posturas dos órgãos dirigentes com relação às suas atribuições. Ainda assim, existem dúvidas a respeito de como a execução dos pontos do programa impõe uma reinterpretação dos vínculos sociais dos índices pretendidos. À luz das boas práticas institucionais, o aumento do diálogo entre os diferentes setores produtivos causa impacto indireto na reavaliação de alternativas às soluções ortodoxas. Sob essa perspectiva, a percepção das dificuldades ressalta a relevância da participação ativa das condições financeiras e administrativas exigidas");

  }

}