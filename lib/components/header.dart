import 'package:fashion_app/components/custom_text.dart';
import 'package:fashion_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(10),
        Center(
          child: CustomText(
            text: title.toUpperCase(),
            fontSize: 15,
            weight: FontWeight.w300,
            space: 4,
            colors: app_colors.primary,
          ),
        ),
        Gap(10),
        Image.asset("assets/svgs/line.png", width: 145, color: Colors.black),
        Gap(20),
      ],
    );
  }
}
