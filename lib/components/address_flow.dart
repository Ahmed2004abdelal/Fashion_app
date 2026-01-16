import 'package:fashion_app/components/custom_text.dart';
import 'package:fashion_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressFlow extends StatelessWidget {
  final dynamic data;
  final Function()? ontap;
  const AddressFlow({super.key, this.data, this.ontap});
  String capitalizeFirst(String text) {
    if (text.isEmpty) {
      return text;
    } else {
      return text[0].toUpperCase() + text.substring(1).toLowerCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      ///on tap to edit
      onTap: () {
        ontap;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text:
                    "${capitalizeFirst(data['first'])} ${capitalizeFirst(data['last'])}",
                fontSize: 19,
                colors: app_colors.primary,
              ),
              CustomText(
                text: "${data['address']}".toUpperCase(),
                fontSize: 16,
                colors: Colors.black54,
              ),
              CustomText(
                text: "${data['city']}".toUpperCase(),
                fontSize: 16,
                colors: Colors.black54,
              ),
              CustomText(
                text: "${data['phone']}".toUpperCase(),
                fontSize: 16,
                colors: Colors.black54,
              ),
            ],
          ),
          SvgPicture.asset("assets/svgs/arrow.svg")
        ],
      ),
    );
  }
}
