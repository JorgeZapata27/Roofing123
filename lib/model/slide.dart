import 'package:flutter/material.dart';

class Slide {
  final String iconName;
  final String title;
  final String desc;
  final String imageName;

  Slide({
    required this.iconName,
    required this.title,
    required this.desc,
    required this.imageName,
  });
}

final slideList = [
  Slide(
    iconName: "assets/images/team_icon.png",
    title: "Best Team!",
    desc:
        "We have highly qualified professionals with all the licenses to ensure a great result.",
    imageName: "assets/images/roofer_reasons.png",
  ),
  Slide(
    iconName: "assets/images/secure_icon.png",
    title: "Always With You",
    desc:
        "From professional advice before starting the project to offering friendly financing options!",
    imageName: "assets/images/family_reasons.png",
  ),
  Slide(
    iconName: "assets/images/roof_icon.png",
    title: "Asphalt Roofing",
    desc:
        " Asphalt shingles are cost-effective and easy to install, maintain, and repair.",
    imageName: "assets/images/roof_reasons.png",
  ),
];
