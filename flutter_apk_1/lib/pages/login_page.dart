import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),
              Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 8,
                    child: Image.network("https://c5gwmsmjx1.execute-api.us-east-1.amazonaws.com/prod/dados_processo_seletivo/logo_empresa/119818/LOGO-DIO-COLOR.png_name_20221031-2831-ekn5hh.png",
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
              const SizedBox(height: 50,),
              const Text(
                "Já tem Cadastro?", 
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              const SizedBox(height: 10,),
              const Text("Faça seu Login e make the change",
              style: TextStyle(fontSize: 14, color: Colors.white),),
              const SizedBox(height: 40,),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: Text("Informe seu Email: ",
                    style: TextStyle(color: Colors.white),)),
                    Expanded(flex:3, child: Text("Email",
                    style: TextStyle(color: Colors.white))),
                  ],
                ),
                ),
              const SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: Text("Informe a senha: ",
                    style: TextStyle(color: Colors.white))),
                    Expanded(flex: 3,child: Text("Senha",
                    style: TextStyle(color: Colors.white)))
                  ],
                ),
                ),
              const SizedBox(height: 30),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30), 
                height: 30,
                child: TextButton(onPressed: () {}, 
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: const Text("ENTRAR")),
                ),
                Expanded(child: Container()),
                const SizedBox(height: 10),
                Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                child: const Text("Esqueci minha senha",
                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w400),
                ),
                ),
              const SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 30,
                child: const Text("Criar conta",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w400),),
                ),
                const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}