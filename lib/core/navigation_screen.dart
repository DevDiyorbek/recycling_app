import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycling_app/presentation/widgets/bottom_nav_bar.dart';

class NavigationScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(navigationShell: navigationShell),
    );
  }
}