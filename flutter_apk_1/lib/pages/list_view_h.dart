import 'package:flutter/material.dart';
import 'package:flutter_apk_1/shared/app_images.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Card(
                child: Image.asset(AppImages.paisagem1),
              ),
              Card(
                child: Image.asset(AppImages.paisagem2)),
              Card(child: Image.asset(AppImages.paisagem3)),
            ]),
          ),
          Expanded(flex: 3, child: Container())
        ],
      ),
    );
  }
}
