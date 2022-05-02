import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';

class OptionButton extends StatelessWidget {
  final Function()? function;
  final String? text;
  final bool? isColumn;
  const OptionButton({
    Key? key,
    this.function,
    this.text,
    this.isColumn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 80,
          width: isColumn ?? false ? 373 : 171,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border(
              top: BorderSide(width: 2.0, color: Color(0xFFE0E0E0)),
              left: BorderSide(width: 2.0, color: Color(0xFFE0E0E0)),
              right: BorderSide(width: 2.0, color: Color(0xFFE0E0E0)),
              bottom: BorderSide(width: 2.0, color: Color(0xFFE0E0E0)),
            ),
          ),
          child: Center(
            child: Styles.regular(
              text ?? "",
              color: textColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
