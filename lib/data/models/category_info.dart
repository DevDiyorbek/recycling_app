import 'named_common_item.dart';

class CategoryInfo {
  final String name;
  final String imagePath;
  final List<String> yesItems;
  final List<String> noItems;
  final List<NamedCommonItem> commonItems;
  final bool isSpecial;

  CategoryInfo({
    required this.name,
    required this.imagePath,
    required this.yesItems,
    required this.noItems,
    required this.commonItems,
    required this.isSpecial,
  });
}
