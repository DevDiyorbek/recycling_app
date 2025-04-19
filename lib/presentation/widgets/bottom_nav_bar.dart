import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recycling_app/core/config/app_colors.dart';
import 'package:recycling_app/presentation/widgets/svg_icon.dart';
import '../../core/config/app_icons.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavBar({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(index);
  }

  static const _destinations = [
    _NavDestination(icon: AppIcons.info, label: 'Info'),
    _NavDestination(icon: AppIcons.location, label: 'Location'),
    _NavDestination(icon: AppIcons.scan, label: 'Scan'),
    _NavDestination(icon: AppIcons.faq, label: 'FAQ'),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: MediaQuery.of(context).size.height * (7 / 59),
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _onTap,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      backgroundColor: AppColors.lightCyan,
      indicatorColor: Colors.transparent,
      destinations: _destinations.map((dest) {
        return NavigationDestination(
          icon: SvgIcon(dest.icon, isSelected: false),
          selectedIcon: SvgIcon(dest.icon, isSelected: true),
          label: dest.label,
        );
      }).toList(),
    );
  }
}



class _NavDestination {
  final String icon;
  final String label;

  const _NavDestination({required this.icon, required this.label});
}
