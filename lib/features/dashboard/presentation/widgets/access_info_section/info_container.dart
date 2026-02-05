import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class InfoContainer extends StatelessWidget {
  final String label;
  const InfoContainer({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(14),
        ),

        child: Text(
          textAlign: TextAlign.center,
          label,
          style: AppTextStyle.regularXs.copyWith(
            color: AppTextStyle.regularXs.color?.withValues(alpha: 0.5),
          ),
        ),
      ),
    );
  }
}
