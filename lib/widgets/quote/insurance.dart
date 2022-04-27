import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';

class InsuranceQuote extends StatelessWidget {
  const InsuranceQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Styles.regular(
            "Interested in Financing?",
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
