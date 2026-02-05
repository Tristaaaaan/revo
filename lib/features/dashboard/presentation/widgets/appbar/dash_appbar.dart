import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/core/appimages/app_images.dart';
import 'package:revo/core/apptext/app_text.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xff0A0A0A),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
        SizedBox(width: AppSpacing.xs),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff0A0A0A),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: Colors.white,
                onPressed: () {},
              ),
            ),

            Positioned(
              right: 4,
              top: 4,
              child: Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: Color(0xffff6900),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Transform.rotate(
          angle: 3.1416 / 3,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.background),
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
              children: [
                Text(
                  AppText.welcomeBack,
                  style: AppTextStyle.regularXs.copyWith(
                    color: AppTextStyle.regularXs.color?.withValues(alpha: 0.4),
                  ),
                ),
                Text('Alex Morgan', style: AppTextStyle.boldMd2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
