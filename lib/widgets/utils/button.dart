import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';

class Button extends StatelessWidget {
  final Function()? function;
  final String? text;
  const Button({
    Key? key,
    this.function,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 45,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xFFEDF0F2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Styles.regular(
              text!,
              color: textColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
