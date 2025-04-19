import 'package:flutter/material.dart';
import '../../data/models/named_common_item.dart';

class CommonItemCard extends StatelessWidget {
  final NamedCommonItem item;

  const CommonItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFA2CE92),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/recycle_symbol.png",
                      height: 100,
                    ),
                    Text(
                      "${item.number}",
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
                Text(
                  item.initialism,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 24),
                      child: Text(
                        "${item.fullName} \nCOMMON ITEMS",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24, height: 1),
                      ),
                    ),
                    const SizedBox(
                      width: 54,
                      child: Divider(
                        thickness: 8,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ...item.examples.map(
                      (example) => Text(
                        example.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black.withOpacity(0.6),
                          height: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
