import 'package:flutter/material.dart';
import 'package:flutter_apk_1/model/card_detail.dart';

class CardDetailPage extends StatefulWidget {
  final CardDetail cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                Row(
                  children: [
                    Image.network(
                      widget.cardDetail.url,
                      height: 100,
                    ),
                  ],
                ),
                Text(
                  widget.cardDetail.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    widget.cardDetail.text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
