import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/quote/values.dart';
import 'package:roofing/widgets/text.dart';
import 'package:roofing/widgets/utils/nav_button.dart';
import 'package:roofing/widgets/utils/textfield.dart';

class FinishQuote extends StatelessWidget {
  final Function()? onNext;
  final Function()? onBack;
  const FinishQuote({
    Key? key,
    required this.onNext,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController addressController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Styles.regular(
              "Just enter your information and get your not obligation estimate!",
              color: textColor,
              fontSize: 35,
              weight: FontWeight.w600,
              align: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            MainTextField(
              title: "Full Name",
              hint: "John Doe",
              id: "fullName",
            ),
            SizedBox(
              height: 10,
            ),
            MainTextField(
              title: "Phone Number",
              hint: "+1 XXX XXX XXXX",
              keyType: TextInputType.phone,
              id: "phoneNumber",
            ),
            MainTextField(
              title: "Email Address",
              hint: "johndoe@gmail.com",
              keyType: TextInputType.emailAddress,
              id: "email",
            ),
            SizedBox(
              height: 10,
            ),
            NavButtonsQuote(
              isEnd: true,
              onNext: onNext,
              onBack: onBack,
            ),
          ],
        ),
      ),
    );
  }
}
