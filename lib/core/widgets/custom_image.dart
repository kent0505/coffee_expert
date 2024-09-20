import 'dart:io';

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    required this.height,
    this.width,
    required this.borderRadius,
  });

  final String image;
  final double height;
  final double? width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        width: width,
        child: Image.file(
          File(image),
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/$image.png',
              fit: BoxFit.cover,
              width: width,
            );
          },
        ),
      ),
    );
  }
}
