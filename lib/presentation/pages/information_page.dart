import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recycling_app/core/config/app_colors.dart';
import '../../data/sample_data/categories_in_detail.dart';
import '../widgets/CategoryCard.dart';
import '../widgets/page_template.dart';
import 'more_info_page.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: 'ITEM SEARCH',
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search by item",
              style: TextStyle(
                fontSize: 24,
                color: AppColors.dark,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    style: const TextStyle(fontSize: 22),
                    placeholder: "Milk bottle",
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.lightGreen),
                      borderRadius: BorderRadius.circular(33),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Search by category",
              style: TextStyle(
                fontSize: 24,
                color: AppColors.dark,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: [
                  CategoryCard(
                    name: "Plastic",
                    image: "assets/images/plastic.png",
                    categoryInfo: plasticCategory,
                  ),
                  CategoryCard(
                    name: "Paper",
                    image: "assets/images/paper.png",
                    categoryInfo: paperCategory,
                  ),
                  CategoryCard(
                    name: "Metal",
                    image: "assets/images/metal.png",
                    categoryInfo: metalCategory,
                  ),
                  CategoryCard(
                    name: "Glass",
                    image: "assets/images/glass.png",
                    categoryInfo: glassCategory,
                  ),
                  CategoryCard(
                    name: "Cardboard",
                    image: "assets/images/cardboard.png",
                    categoryInfo: cardboardCategory,
                  ),
                  CategoryCard(
                    name: "Electric",
                    image: "assets/images/electric.png",
                    categoryInfo: electricCategory,
                  ),
                  CategoryCard(
                    name: "Battery",
                    image: "assets/images/battery.png",
                    categoryInfo: batteryCategory,
                  ),
                  CategoryCard(
                    name: "Organic",
                    image: "assets/images/organic.png",
                    categoryInfo: organicCategory,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
