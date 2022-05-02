import 'package:flutter/material.dart';
import 'package:roofing/constants/colors.dart';
import 'package:roofing/widgets/quote/values.dart';
import 'package:roofing/widgets/text.dart';

class MainTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? isAddress;
  final TextEditingController? controller;
  final TextInputType? keyType;
  final String? id;

  const MainTextField({
    Key? key,
    required this.title,
    required this.hint,
    required this.id,
    this.isAddress,
    this.keyType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 475,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Styles.regular(
            title!,
            color: textColor,
            fontSize: 20,
            weight: FontWeight.w400,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            onChanged: (text) {
              switch (id) {
                case "address":
                  address = text;
                  break;
                case "sqfootage":
                  sqfootage = text;
                  break;
                case "fullName":
                  fullName = text;
                  break;
                case "phoneNumber":
                  phoneNumber = text;
                  break;
                case "email":
                  email = text;
                  break;
              }
            },
            keyboardType: keyType,
            cursorColor: mainColor,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              hintText: hint!,
              hintStyle: TextStyle(
                color: Color(0xFF959DAA),
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: mainColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: mainColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: mainColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
