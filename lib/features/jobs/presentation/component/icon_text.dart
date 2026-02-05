import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class ImageText extends StatelessWidget {
  final String imagePath;
  final String text;
  const ImageText({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(imagePath, width: 20, height: 20, fit: BoxFit.contain),
        SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyle.regularXs.copyWith(
            color: AppTextStyle.regularXs.color?.withValues(alpha: (0.4)),
          ),
        ),
      ],
    );
  }
}
