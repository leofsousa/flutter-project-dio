import 'package:flutter/material.dart';
import 'package:flutter_apk_1/shared/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({super.key});

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPageState();
}

class _ImageAssetsPageState extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.userf,
          height: 50,
        ),
        Image.asset(
          AppImages.userm,
          height: 50,
        ),
        Image.asset(
          AppImages.paisagem1,
        width: double.infinity,
        ),
        Image.asset(
          AppImages.paisagem2,
          height: 50,
        ),
        Image.asset(
          AppImages.paisagem3,
          height: 50,
        )
      ],
    );
  }
}
