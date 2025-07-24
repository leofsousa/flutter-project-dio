import 'package:flutter/material.dart';
import 'package:flutter_apk_1/pages/pagina1.dart';
import 'package:flutter_apk_1/pages/pagina2.dart';
import 'package:flutter_apk_1/pages/pagina3.dart';
import 'package:flutter_apk_1/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                  
                },
                scrollDirection: Axis.horizontal,
                children: const [
                  Pagina1Page(),
                  Pagina2Page(),
                  Pagina3Page(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value){
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
              BottomNavigationBarItem(label: "Pag3", icon: Icon(Icons.person)),
            ])
          ],
        ),
      ),
    );
  }
}
