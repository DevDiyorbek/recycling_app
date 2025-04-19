import 'package:flutter/material.dart';
import 'package:recycling_app/core/config/app_colors.dart';
import 'package:recycling_app/presentation/pages/qr_scan_page.dart';

import '../../data/sample_data/categories_in_detail.dart';
import 'more_info_page.dart';

class ScanResultPage extends StatelessWidget {
  final String result;

  const ScanResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA2CE92),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    Stack(
                      children: [
                        Text(
                          "THIS IS A $result",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 33,
                            letterSpacing: 4,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = const Color(0xFFC6E5BA),
                          ),
                        ),
                        Text(
                          "THIS IS A $result",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 33,
                            letterSpacing: 4,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Recycling Symbol:",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/recycle_symbol.png",
                          height: 130,
                        ),
                        const Positioned.fill(
                          child: Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "PET",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      "Category:",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    const Text(
                      "PLASTIC",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MoreInfoPage(category: plasticCategory),
                          ),
                        );
                      },
                      child: const Text(
                        "Click to learn more",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Recycle steps:",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      "assets/images/bottle_recycle_steps.png",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "GOT IT",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
