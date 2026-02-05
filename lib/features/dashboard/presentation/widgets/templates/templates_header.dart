import 'package:flutter/material.dart';
import 'package:revo/features/dashboard/presentation/widgets/buttons/view_all/view_all.dart';

class TeamplatesHeader extends StatelessWidget {
  const TeamplatesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Templates',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        ViewAllButton(),
      ],
    );
  }
}
