import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class ToggleButton extends StatelessWidget {
  final String label;
  final bool selected;
  final Color selectedColor;
  final VoidCallback onTap;

  const ToggleButton({
    super.key,
    required this.label,
    required this.selected,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).colorScheme.primaryContainer
              : null,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: selected
              ? AppTextStyle.regularXs
              : AppTextStyle.regularXs.copyWith(
                  color: AppTextStyle.regularXs.color?.withValues(alpha: (0.4)),
                ),
        ),
      ),
    );
  }
}
