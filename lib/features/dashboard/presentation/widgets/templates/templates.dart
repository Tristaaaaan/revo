import 'package:flutter/material.dart';
import 'package:revo/features/dashboard/presentation/widgets/templates/teamplates_header.dart';
import 'package:revo/features/dashboard/presentation/widgets/templates/templates_body.dart';

class Templates extends StatelessWidget {
  const Templates({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [TeamplatesHeader(), TemplatesBody()],
    );
  }
}
