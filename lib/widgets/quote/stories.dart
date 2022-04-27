import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';

class StoriesQuote extends StatelessWidget {
  const StoriesQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Styles.regular(
            "No. of Stories",
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
