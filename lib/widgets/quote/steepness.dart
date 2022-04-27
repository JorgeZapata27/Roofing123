import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';

class SteepnessQuote extends StatelessWidget {
  const SteepnessQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Styles.regular(
            "How Steep Is Your Roof?",
            color: textColor,
            fontSize: 35,
            weight: FontWeight.w600,
            align: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
