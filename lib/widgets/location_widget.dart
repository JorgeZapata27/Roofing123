import 'package:flutter/material.dart';
import 'package:roofing/widgets/text.dart';

class LocaationWidget extends StatelessWidget {
  final double width;
  final String title;
  const LocaationWidget({
    Key? key,
    required this.width,
    required this.title,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: width,
      child: Center(
        child: Styles.regular(
          title,
          fontSize: 18,
          color: Color(0xFF737F94),
          align: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFF828DA0)),
          left: BorderSide(width: 1.0, color: Color(0xFF828DA0)),
          right: BorderSide(width: 1.0, color: Color(0xFF828DA0)),
          bottom: BorderSide(width: 1.0, color: Color(0xFF828DA0)),
        ),
      ),
    );
  }
}
