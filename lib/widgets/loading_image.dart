import 'package:flutter/material.dart';

class LoadingImage extends StatelessWidget {
  const LoadingImage({super.key, required this.image, required this.height});
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.network(
            image,
            height: height,
            fit: BoxFit.contain,
          ),
        ),
        const Center(child: CircularProgressIndicator())
      ],
    );
  }
}
