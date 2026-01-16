import 'package:fashion_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final bool isFree;
  final IconData icon;
  const CustomContainer({
    super.key,
    required this.text,
    required this.isFree,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(100),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: text, colors: Colors.black, fontSize: 15),
          Spacer(),
          isFree
              ? CustomText(text: "FREE", colors: Colors.black)
              : SizedBox.shrink(),
          Gap(15),
          Icon(icon),
        ],
      ),
    );
  }
}
