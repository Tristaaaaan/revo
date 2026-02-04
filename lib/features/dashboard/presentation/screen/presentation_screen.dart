import 'package:flutter/material.dart';
import 'package:revo/features/dashboard/presentation/widgets/card/info_card.dart';
import 'package:revo/features/dashboard/presentation/widgets/info_container.dart';
import 'package:revo/features/dashboard/presentation/widgets/recent_calls/recent_call_container.dart';
import 'package:revo/features/dashboard/presentation/widgets/templates/templates.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,

            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
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
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InfoContainer(label: 'Service Area'),
                    InfoContainer(label: 'Job Sources'),
                    InfoContainer(label: 'Walk-in Store'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ButtonCard(
                      content: Container(child: Text("Hehe")),
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

                      title: "Projects",
                      buttonKey: "addProject",
                      buttonText: "Add project",
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
                RecentCallContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
