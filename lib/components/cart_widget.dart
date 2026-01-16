import 'package:fashion_app/components/custom_text.dart';
import 'package:fashion_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartWidget extends StatefulWidget {
  final Function(int) onchange;
  final String image;
  final String name;
  final int price;
  final String description;
  final int qty;
  const CartWidget({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.onchange,
    required this.qty,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late int num;

  @override
  void initState() {
    num = 1;
    num = widget.qty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.image, width: 110, fit: BoxFit.cover),
        Gap(13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            CustomText(
              space: 4,
              text: widget.name.toUpperCase(),
              colors: app_colors.primary,
            ),
            Gap(10),
            SizedBox(
              width: size.width * 0.5,
              child: CustomText(
                space: 2,
                fontSize: 12,
                text: widget.description.toUpperCase(),
                colors: app_colors.primary,
              ),
            ),

            Gap(30),
            Row(
              children: [
                qty("assets/svgs/min.svg", () {
                  setState(() {
                    if (num > 1) {
                      num--;
                      widget.onchange(num);
                    }
                  });
                }),
                Gap(10),
                CustomText(
                  space: 4,
                  text: num.toString(),
                  colors: app_colors.primary,
                  weight: FontWeight.bold,
                ),
                Gap(10),
                qty("assets/svgs/plus.svg", () {
                  setState(() {
                    num++;
                    widget.onchange(num);
                  });
                }),
              ],
            ),
            Gap(25),
            CustomText(
              text: "\$ ${widget.price}",
              colors: Colors.red.shade200,
              fontSize: 22,
            ),
          ],
        ),
      ],
    );
  }
}

Widget qty(svg, ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: SvgPicture.asset(svg),
    ),
  );
}
