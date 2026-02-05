import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';

class MemberAvatars extends StatelessWidget {
  final List<String> imageUrls; // list of member avatar URLs
  final double radius;
  final double overlap; // how much the avatars overlap

  const MemberAvatars({
    super.key,
    required this.imageUrls,
    this.radius = 18,
    this.overlap = 15,
  });

  @override
  Widget build(BuildContext context) {
    final maxAvatars = 3;
    final displayAvatars = imageUrls.take(maxAvatars).toList();
    final extraCount = imageUrls.length - maxAvatars;

    return SizedBox(
      height: radius * 2,
      child: Stack(
        children: [
          for (int i = 0; i < displayAvatars.length; i++)
            Positioned(
              left: i * (radius * 2 - overlap),
              child: CircleAvatar(
                backgroundImage: NetworkImage(displayAvatars[i]),
                radius: radius,
              ),
            ),
          if (extraCount > 0)
            Positioned(
              left: maxAvatars * (radius * 2 - overlap),
              child: CircleAvatar(
                radius: radius,
                backgroundColor: Color(0xff1d1f21),
                child: Text('+$extraCount', style: AppTextStyle.regularXs),
              ),
            ),
        ],
      ),
    );
  }
}
