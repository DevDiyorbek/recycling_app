import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycling_app/presentation/pages/bin_locator_page.dart';
import 'package:recycling_app/presentation/pages/faq_page.dart';
import 'package:recycling_app/presentation/pages/information_page.dart';
import 'package:recycling_app/presentation/pages/more_info_page.dart';
import 'package:recycling_app/presentation/pages/qr_scan_page.dart';
import 'package:recycling_app/core/navigation_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/info',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            NavigationScreen(navigationShell: navigationShell),
        branches: _buildBranches(),
      ),
    ],
  );

  static List<StatefulShellBranch> _buildBranches() {
    final routes = [
      {'path': '/info', 'page': const InformationPage()},
      {'path': '/location', 'page': const BinLocatorPage()},
      {'path': '/qr_scan', 'page': const QRScanPage()},
      {'path': '/faq', 'page': const FaqPage()},
      {'path': '/qr_scan', 'page': const NoTransitionPage(child: QRScanPage())},
    ];

    return routes
        .map((route) => StatefulShellBranch(
      routes: [
        GoRoute(
          path: route['path'] as String,
          pageBuilder: (context, state) => NoTransitionPage(
            child: route['page'] as Widget,
          ),
        ),
      ],
    )).toList();
  }
}