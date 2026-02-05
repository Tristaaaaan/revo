import 'package:flutter/material.dart';

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
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
