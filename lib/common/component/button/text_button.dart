import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class CustomTextButtom extends StatelessWidget {
  final String text;
  const CustomTextButtom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyle.boldXs.copyWith(
                color: AppTextStyle.boldXs.color?.withValues(alpha: (0.4)),
              ),
            ),
            SizedBox(width: AppSpacing.xs),
            Icon(Icons.arrow_forward_ios, color: Color(0xff7A7A7A), size: 12),
          ],
        ),
      ),
    );
  }
}
