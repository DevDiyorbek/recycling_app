import 'package:flutter/material.dart';
import 'package:recycling_app/presentation/widgets/common_item_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/config/app_colors.dart';
import '../../data/models/category_info.dart';

class MoreInfoPage extends StatefulWidget {
  final CategoryInfo category;

  const MoreInfoPage({super.key, required this.category});

  @override
  State<MoreInfoPage> createState() => _MoreInfoPageState();
}

class _MoreInfoPageState extends State<MoreInfoPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final items = widget.category.commonItems;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, size: 35),
                  ),
                  Text(
                    widget.category.name,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  )
                ],
              ),
            ),
            Expanded(
                child: PageView.builder(
              controller: _pageController,
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _yesNoPage();
                }
                final item = items[index - 1];
                return CommonItemCard(item: item);
              },
            )),
            const SizedBox(height: 12),
            SmoothPageIndicator(
              controller: _pageController,
              count: items.length + 1,
              effect: const WormEffect(
                dotHeight: 9,
                dotWidth: 9,
                activeDotColor: AppColors.lightCyan,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _yesNoPage() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFA2CE92),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                widget.category.imagePath,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(56, 32, 44, 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.category.isSpecial
                          ? const Text("SPECIAL RECYCLING PLACES ONLY",
                              style: TextStyle(fontSize: 24, height: 1),
                              textAlign: TextAlign.center)
                          : const SizedBox(),
                      const Text(
                        "YES:",
                        style: TextStyle(
                          fontSize: 24,
                          height: 1,
                          color: AppColors.lightGreen,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...widget.category.yesItems.map(
                        (yes) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("• ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    height: 1,
                                  )),
                              Expanded(
                                child: Text(
                                  yes,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "NO:",
                        style: TextStyle(
                          fontSize: 24,
                          height: 1,
                          color: AppColors.red,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...widget.category.noItems.map(
                        (no) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("• ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    height: 1,
                                  )),
                              Expanded(
                                child: Text(
                                  no,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
