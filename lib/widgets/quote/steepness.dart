import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/text.dart';
import 'package:roofing/widgets/utils/button.dart';
import 'package:roofing/widgets/utils/option_button.dart';

class SteepnessQuote extends StatelessWidget {
  final Function()? onSomewhat;
  final Function()? onSteep;
  final Function()? onVerySteep;
  final Function()? onBack;
  const SteepnessQuote({
    Key? key,
    required this.onBack,
    required this.onSteep,
    required this.onSomewhat,
    required this.onVerySteep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                text: "Somewhat Steep",
                function: onSomewhat,
                isColumn: true,
              ),
              SizedBox(
                height: 28,
              ),
              OptionButton(
                text: "Steep",
                isColumn: true,
                function: onSteep,
              ),
              SizedBox(
                height: 28,
              ),
              OptionButton(
                text: "Very Steep",
                function: onVerySteep,
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
