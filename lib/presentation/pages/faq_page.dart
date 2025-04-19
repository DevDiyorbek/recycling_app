import 'package:flutter/material.dart';
import '../../core/config/app_colors.dart';
import '../widgets/page_template.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: "FORUM",
      body: Center(
        child: FaqTipsColumn(),
      ),
    );
  }
}

class FaqTipsColumn extends StatelessWidget {
  FaqTipsColumn({super.key});

  final List<String> faqs = [
    "WHAT ARE SOME ITEMS WE SHOULD NEVER RECYCLE?",
    "WHAT IS COMPOSTING AND HOW IS IT BENEFICIAL FOR THE ENVIRONMENT?",
    "HOW CAN I RECYCLE HOUSEHOLD HAZARDOUS WASTE?",
    "WHERE DO I RECYCLE ELECTRONICS?",
    "HOW DO I PROPERLY RECYCLE SHARP ITEMS?",
  ];

  final List<String> tips = [
    "REMEMBER TO CLEAN OUT THE ITEMS BEFORE RECYCLING!",
    "*RECYCLING ITEMS AND CONTAINERS THAT STILL HAVE FOOD ON THEM CAN CONTAMINATE "
        "AN ENTIRE TRUCKLOAD OF RECYCLING PRODUCTS! MAKE SURE ALL PRODUCTS ARE EMPTY, "
        "CLEAN, AND DRY BEFORE RECYCLING!"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          "FAQs:",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        _buildContainer(faqs),
        const Text(
          "QUICK TIPS & TRICKS:",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        _buildContainer(tips),
      ],
    );
  }

  Widget _buildContainer(List<String> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(38),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "• ",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.primaryTextColor,
                    height: 1,
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1,
                      color: AppColors.primaryTextColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
