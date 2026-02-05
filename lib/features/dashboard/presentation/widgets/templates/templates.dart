import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/dashboard/presentation/widgets/templates/templates_content.dart';
import 'package:revo/features/dashboard/presentation/widgets/templates/templates_header.dart';

class Templates extends StatelessWidget {
  const Templates({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TeamplatesHeader(),
        SizedBox(height: AppSpacing.sm),
        TemplatesBody(),
      ],
    );
  }
}
