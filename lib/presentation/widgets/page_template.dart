import 'package:flutter/material.dart';
import '../../core/config/app_colors.dart';

class PageTemplate extends StatelessWidget {
  final String title;
  final Widget body;

  const PageTemplate({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          color: AppColors.primary,
          child: Column(
            children: [
              Container(
                height: height * (7 / 59),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 30,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              Expanded(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
