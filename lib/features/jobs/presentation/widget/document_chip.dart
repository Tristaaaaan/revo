import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class DocumentChip extends StatelessWidget {
  final String text;
  final IconData icon;

  const DocumentChip({
    super.key,
    required this.text,
    this.icon = Icons.file_present,
  });

  static final _random = Random();

  static const _colors = [
    Color(0xFFFF6900),
    Color(0xFF2B7FFF),
    Color(0xff8b5cf6),
  ];

  @override
  Widget build(BuildContext context) {
    final color = _colors[_random.nextInt(_colors.length)];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(AppRadius.xs),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppRadius.xs),
            ),
            child: Icon(icon, size: 15, color: Colors.white),
          ),

          const SizedBox(width: 5),

          Text(text, style: TextStyle(fontSize: 12, color: color)),
        ],
      ),
    );
  }
}
