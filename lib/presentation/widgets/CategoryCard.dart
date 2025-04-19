import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recycling_app/data/models/category_info.dart';

import '../../core/config/app_colors.dart';
import '../pages/more_info_page.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;
  final CategoryInfo categoryInfo;

  const CategoryCard({
    super.key,
    required this.name,
    required this.image,
    required this.categoryInfo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoreInfoPage(category: categoryInfo),
          ),
        );
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
