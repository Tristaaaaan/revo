import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 125,
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
        SizedBox(width: AppSpacing.xs),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.primaryContainer, // background color
            shape: BoxShape.circle, // circular background
          ),
          child: IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.white, // icon color
            onPressed: () {},
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Transform.rotate(
          angle: 3.1416 / 3, // 45 degrees clockwise (in radians)
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/calls/background.png'),
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              ),
              radius: 25,
            ),

            const SizedBox(width: 12),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Alex Morgan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
