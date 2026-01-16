import 'package:fashion_app/components/cart_widget.dart';
import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/components/custom_button.dart';
import 'package:fashion_app/components/custom_text.dart';
import 'package:fashion_app/components/header.dart';
import 'package:fashion_app/core/colors.dart';
import 'package:fashion_app/screens/place_oreder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckOut extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final String description;
  const CheckOut({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int qtyy = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Header(title: "checkout"),
              CartWidget(
                qty: qtyy,
                onchange: (v) {
                  setState(() {
                    qtyy = v;
                  });
                },
                description: widget.description,
                image: widget.image,
                name: widget.name,
                price: widget.price,
              ),
              Gap(20),
              promo(),
              // Spacer(),
              Gap(140),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Est. Total", colors: app_colors.primary),
                  CustomText(
                    text: "\$ ${widget.price * qtyy}",
                    colors: Colors.red.shade200,
                  ),
                ],
              ),
              Gap(20),
              CustomButton(
                isSvgg: true,
                title: "Checkout",
                ontapp: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceOreder(
                        image: widget.image,
                        price: widget.price,
                        total: widget.price * qtyy,
                        qty: qtyy,
                        descrp: widget.description,
                        name: widget.name,
                      ),
                    ),
                  );
                },
              ),
              Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}

Widget promo() {
  return Column(
    children: [
      Divider(),
      Gap(20),
      Row(
        children: [
          Gap(13),
          SvgPicture.asset("assets/svgs/promo.svg", width: 28),
          CustomText(text: "ADD Promo Code", colors: app_colors.primary),
        ],
      ),
      Gap(10),
      Divider(),
      Gap(20),
      Row(
        children: [
          Gap(13),
          SvgPicture.asset("assets/svgs/delivery.svg", width: 25),
          CustomText(text: "Delivery", colors: app_colors.primary),
          Spacer(),
          CustomText(text: "Free".toUpperCase(), colors: app_colors.primary),
        ],
      ),
      Gap(10),
      Divider(),
    ],
  );
}
