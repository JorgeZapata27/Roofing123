import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';

class MainButton extends StatelessWidget {
  MainButton({
    Key? key,
    this.buttonColor,
    this.function,
    this.widget,
    this.text,
    this.isBold,
  }) : super(key: key);

  final Color? buttonColor;
  final Function()? function;
  final Widget? widget;
  final String? text;
  bool? isBold = true;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Styles.regular(
              text!,
              weight: isBold! ? FontWeight.bold : FontWeight.bold,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
