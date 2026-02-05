import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:revo/features/navigation/gate.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Navigation();
      },
    ),
  ],
);
