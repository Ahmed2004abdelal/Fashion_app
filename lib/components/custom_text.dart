import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color colors;
  final int max;
  final double height;
  final double space;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.height = 1.0,
    this.weight = FontWeight.normal,
    this.colors = Colors.white,
    this.max = 1,
    this.space = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: max,
      style: TextStyle(
        letterSpacing: space,
        height: height,
        fontSize: fontSize,
        color: colors,
        overflow: TextOverflow.ellipsis,
        fontWeight: weight,
        fontFamily: "TenorSans",
      ),
    );
  }
}
