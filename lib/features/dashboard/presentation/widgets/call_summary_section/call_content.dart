import 'package:flutter/widgets.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class CallContent extends StatelessWidget {
  final String header;
  final Widget content;
  const CallContent({super.key, required this.header, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: AppTextStyle.regularXs.copyWith(
            color: AppTextStyle.regularXs.color?.withValues(alpha: (0.4)),
          ),
        ),
        SizedBox(height: AppSpacing.xs),
        content,
      ],
    );
  }
}
