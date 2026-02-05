import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revo/common/component/navbar/custom_navbar.dart';
import 'package:revo/features/calls/presentation/screen/call_screen.dart';
import 'package:revo/features/dashboard/presentation/screen/presentation_screen.dart';
import 'package:revo/features/navigation/presentation/cubit/navigation_cubit.dart';
import 'package:revo/features/navigation/presentation/cubit/navigation_state.dart';
import 'package:revo/features/tools/presentation/screen/tool_screen.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: _NavigationView(),
    );
  }
}

class _NavigationView extends StatelessWidget {
  const _NavigationView();

  final List<Widget> _screens = const [
    DashboardScreen(),
    CallScreen(),
    ToolScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: _screens[state.selectedIndex],
          ),

          bottomNavigationBar: AnimatedOpacity(
            opacity: state.isHolding ? 0 : 1,
            duration: const Duration(milliseconds: 200),
            child: IgnorePointer(
              ignoring: state.isHolding,
              child: CustomBottomNavBar(
                currentIndex: state.selectedIndex,
                onTap: context.read<NavigationCubit>().changeTab,
              ),
            ),
          ),
        );
      },
    );
  }
}
