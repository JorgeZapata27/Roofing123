import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';

class CategoryTile extends StatelessWidget {
  final bool isSelected;
  final String categoryName;
  final VoidCallback onTap;

  const CategoryTile(
      {Key? key,
      required this.categoryName,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 210;
    switch (categoryName) {
      case "Roofing Installation":
        width = 210;
        break;
      case "Storm Damage":
        width = 175;
        break;
      case "Shingle Installation":
        width = 195;
        break;
      case "Siding":
        width = 90;
        break;
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? Color(0xFFEEEDFF) : Colors.white,
          ),
          child: Container(
            child: Center(
              child: Styles.regular(
                categoryName,
                color: isSelected ? mainColor : secondTextColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
