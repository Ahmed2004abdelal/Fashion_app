import 'package:fashion_app/components/custom_container.dart';
import 'package:fashion_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20),
        CustomText(
          text: "Shipping Method".toUpperCase(),
          fontSize: 16,
          colors: Colors.black54,
        ),
        Gap(15),
        CustomContainer(
          text: "pickup at store",
          isFree: true,
          icon: Icons.keyboard_arrow_down_sharp,
        ),
      ],
    );
  }
}
