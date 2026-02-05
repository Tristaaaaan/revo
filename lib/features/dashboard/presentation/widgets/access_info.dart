import 'package:flutter/material.dart';
import 'package:revo/features/dashboard/presentation/widgets/info_container.dart';

class AccessInfo extends StatelessWidget {
  const AccessInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoContainer(label: 'Service Area'),
          InfoContainer(label: 'Job Sources'),
          InfoContainer(label: 'Walk-in Store'),
        ],
      ),
    );
  }
}
