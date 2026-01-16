import 'package:fashion_app/components/custom_text.dart';
import 'package:fashion_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  final Function()? ontapp;
  final bool isSvgg;
  final String title;
  const CustomButton({super.key, required this.isSvgg, required this.title, this.ontapp});

  @override
  Widget build(BuildContext context) {
    bool isSvg = isSvgg;
    return GestureDetector(
      onTap: ontapp,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 16),
        color: app_colors.primary,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSvg
                ? SvgPicture.asset("assets/svgs/shopping bag.svg", width: 18)
                : SizedBox.shrink(),
            Gap(15),
            CustomText(text: title.toUpperCase(), fontSize: 16),
          ],
        ),
      ),
    );
  }
}
