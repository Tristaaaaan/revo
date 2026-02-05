import 'package:flutter/material.dart';
import 'package:revo/core/appdesign/design_tokens.dart';
import 'package:revo/features/calls/presentation/recent_call_page.dart';
import 'package:revo/features/dashboard/presentation/widgets/access_info.dart';
import 'package:revo/features/dashboard/presentation/widgets/call_summary/call_summary.dart';
import 'package:revo/features/dashboard/presentation/widgets/card/info_card.dart';
import 'package:revo/features/dashboard/presentation/widgets/member_avatars/member_avatars.dart';
import 'package:revo/features/dashboard/presentation/widgets/templates/templates.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 125,
              actions: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primaryContainer, // background color
                    shape: BoxShape.circle, // circular background
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.white, // icon color
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
            ),
            AccessInfo(),
            CallSummary(),
            SliverToBoxAdapter(
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
                        onTap: () {
                          // extra callback if needed
                          print("Add member tapped");
                        },
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
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
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
                        onTap: () {
                          print("Add project tapped");
                        },
                      ),
                    ],
                  ),
                  Templates(),
                ],
              ),
            ),

            CallHistoryPage(),
          ],
        ),
      ),
    );
  }
}
