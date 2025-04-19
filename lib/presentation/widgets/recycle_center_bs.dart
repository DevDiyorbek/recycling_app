import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recycling_app/data/models/category_info.dart';
import 'package:recycling_app/data/sample_data/categories_in_detail.dart';

import '../../core/config/app_colors.dart';
import '../pages/more_info_page.dart';

class RecycleCentersBottomSheet extends StatefulWidget {
  const RecycleCentersBottomSheet({super.key});

  @override
  State<RecycleCentersBottomSheet> createState() =>
      _RecycleCentersBottomSheetState();
}

class _RecycleCentersBottomSheetState extends State<RecycleCentersBottomSheet> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height * (isExpanded ? 0.68 : 0.4);

    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.lightGreen.withOpacity(0.64),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(33)),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: height,
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(33)),
        ),
        child: Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      size: 33,
                    ),
                    onPressed: () {
                      !isExpanded
                          ? Navigator.of(context).pop()
                          : setState(() {
                              isExpanded = !isExpanded;
                            });
                    },
                  ),
                  isExpanded
                      ? const SizedBox()
                      : IconButton(
                          icon: const Icon(
                            Icons.open_in_full_sharp,
                            size: 33,
                          ),
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                        ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: !isExpanded
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const Text(
                        "Recycling Centre",
                        style: TextStyle(fontSize: 26),
                      ),
                      const Text(
                        "Location: 123 xxx Street, State College, PA",
                        style: TextStyle(fontSize: 13),
                      ),
                      const SizedBox(height: 4),
                      Image.asset(
                        "assets/images/bin.png",
                        height: MediaQuery.of(context).size.height * 0.17,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Recycle Categories",
                        style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 220,
                        child: Divider(
                          height: 8,
                          thickness: 1,
                          color: Color(0xFFA2CE92),
                        ),
                      ),
                      _customCategoryText("Cardboard", cardboardCategory),
                      _customCategoryText("Mixed Paper", paperCategory),
                      _customCategoryText("Plastic", plasticCategory),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "Instructions:",
                        style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 220,
                        child: Divider(
                          height: 18,
                          thickness: 1,
                          color: Color(0xFFA2CE92),
                        ),
                      ),
                      const Text(
                        "For Cardboard,",
                        style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: 18,
                        ),
                      ),
                      Image.asset(
                        "assets/images/cardboard_inst.png",
                        width: MediaQuery.of(context).size.width * 0.9,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customCategoryText(String categoryName, CategoryInfo categoryInfo) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoreInfoPage(category: categoryInfo),
          ),
        );
      },
      child: Text(
        categoryName,
        style: const TextStyle(
          color: AppColors.primaryTextColor,
          fontSize: 18,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryTextColor,
        ),
      ),
    );
  }
}
