import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: isActive ? mainColor : Color(0xFFE7E9FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
