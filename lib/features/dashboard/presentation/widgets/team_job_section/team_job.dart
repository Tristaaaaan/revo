import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/dashboard/presentation/widgets/team_job_section/info_card.dart';
import 'package:revo/features/dashboard/presentation/widgets/team_job_section/member_avatars.dart';

class TeamJob extends StatelessWidget {
  const TeamJob({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            children: [
              ButtonCard(
                content: MemberAvatars(
                  imageUrls: [
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
                    'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg',
                    'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg',
                    'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
                    'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg',
                    'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg',
                    'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
                    'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg',
                    'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg',
                    'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
                    'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg',
                    'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg',
                    'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
                  ],
                ),
                title: "Team",
                buttonKey: "addMember",
                buttonText: "Add member",
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: .05),
                textColor: Colors.white,
                onTap: () {},
              ),
              ButtonCard(
                content: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "13 ",
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: "Total",
                        style: AppTextStyle.regularMd.copyWith(
                          color: AppTextStyle.regularMd.color?.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                title: "Job types",
                buttonKey: "addNew",
                buttonText: "Add new",
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: .05),
                textColor: Colors.white,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
