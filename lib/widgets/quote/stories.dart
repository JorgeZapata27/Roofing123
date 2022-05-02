import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/radio/radio.dart';
import 'package:roofing/widgets/text.dart';
import 'package:roofing/widgets/utils/button.dart';
import 'package:roofing/widgets/utils/nav_button.dart';
import 'package:roofing/widgets/utils/option_button.dart';
import 'package:roofing/widgets/utils/textfield.dart';

class StoriesQuote extends StatelessWidget {
  final Function()? onSingle;
  final Function()? onDouble;
  final Function()? onBack;
  const StoriesQuote({
    Key? key,
    required this.onBack,
    required this.onSingle,
    required this.onDouble,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController = TextEditingController();
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: SingleChildScrollView(
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
              Styles.regular(
                "Please select from the bellow option",
                color: textColor,
                fontSize: 20,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  OptionButton(
                    text: "1 Story",
                    function: onSingle,
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  OptionButton(
                    text: "2 Stories",
                    function: onDouble,
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
        ),
      ),
    );
  }
}
