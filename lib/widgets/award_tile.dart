import 'package:flutter/material.dart';

class AwardTile extends StatelessWidget {
  final String imageName;
  const AwardTile({
    Key? key,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 70,
      child: Center(
        child: Image.asset(
          "assets/images/${imageName}",
        ),
      ),
    );
  }
}
