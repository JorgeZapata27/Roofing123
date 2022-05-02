import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/radio/radio.dart';
import 'package:roofing/widgets/text.dart';
import 'package:roofing/widgets/utils/button.dart';
import 'package:roofing/widgets/utils/option_button.dart';

class InsuranceQuote extends StatelessWidget {
  final Function()? onNo;
  final Function()? onOther;
  final Function()? onYes;
  final Function()? onBack;
  const InsuranceQuote({
    Key? key,
    required this.onBack,
    required this.onYes,
    required this.onNo,
    required this.onOther,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            height: 10,
          ),
          Styles.regular(
            "Please select from the bellow option",
            color: textColor,
            fontSize: 20,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              OptionButton(
                text: "Yes",
                function: onYes,
                isColumn: true,
              ),
              SizedBox(
                height: 28,
              ),
              OptionButton(
                text: "No",
                function: onNo,
                isColumn: true,
              ),
              SizedBox(
                height: 28,
              ),
              OptionButton(
                text: "I have an insurance to repair my roofing",
                function: onOther,
                isColumn: true,
              ),
              SizedBox(
                height: 28,
              ),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          Button(
            text: "Back",
            function: onBack,
          ),
        ],
      ),
    );
  }
}
