import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/quote/size.dart';
import 'package:roofing/widgets/text.dart';
import 'package:roofing/widgets/utils/nav_button.dart';
import 'package:roofing/widgets/utils/textfield.dart';

class LocationQuote extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;
  const LocationQuote({
    Key? key,
    required this.onNext,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController = TextEditingController();
    var isClear = (addressController.text != "");
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Styles.regular(
            "Enter Your Address",
            color: textColor,
            fontSize: 35,
            weight: FontWeight.w600,
            align: TextAlign.left,
          ),
          SizedBox(
            height: 20,
          ),
          MainTextField(
            title: "Your Address",
            hint: "300 E Clifford Dr",
            controller: addressController,
          ),
          SizedBox(
            height: 80,
          ),
          NavButtonsQuote(
            onNext: onNext,
            onBack: onBack,
          ),
        ],
      ),
    );
  }
}
