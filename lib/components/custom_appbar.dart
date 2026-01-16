import 'package:fashion_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBlack;
  @override
  Size get preferredSize => const Size.fromHeight(80);

  const CustomAppbar({super.key, required this.isBlack});

  @override
  Widget build(BuildContext context) {
    bool isblack = isBlack;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        leadingWidth: 20,
        centerTitle: true,
        backgroundColor: isblack ? app_colors.primary : Colors.white,
        leading: SvgPicture.asset(
          "assets/svgs/Menu.svg",
          color: isblack ? Colors.white : app_colors.primary,
        ),
        title: SvgPicture.asset(
          "assets/logo/logo-bg.svg",
          color: isblack ? Colors.white : app_colors.primary,
        ),
        actions: [
          SvgPicture.asset(
            "assets/svgs/Search.svg",
            color: isblack ? Colors.white : app_colors.primary,
          ),
          Gap(20),
          SvgPicture.asset(
            "assets/svgs/shopping bag.svg",
            color: isblack ? Colors.white : app_colors.primary,
          ),
        ],
      ),
    );
  }
}
