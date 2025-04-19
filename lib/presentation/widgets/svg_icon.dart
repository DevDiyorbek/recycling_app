import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/config/app_colors.dart';

class SvgIcon extends StatelessWidget {
  final String asset;
  final bool isSelected;

  const SvgIcon(this.asset, {super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SvgPicture.asset(
        asset,
        height: 44,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.white : AppColors.forestGreen,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}