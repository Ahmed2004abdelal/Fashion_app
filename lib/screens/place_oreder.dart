import 'package:fashion_app/components/address_flow.dart';
import 'package:fashion_app/components/cart_widget.dart';
import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/components/custom_button.dart';
import 'package:fashion_app/components/custom_container.dart';
import 'package:fashion_app/components/custom_text.dart';
import 'package:fashion_app/components/header.dart';
import 'package:fashion_app/components/shipping_method.dart';
import 'package:fashion_app/core/colors.dart';
import 'package:fashion_app/screens/add_address.dart';
import 'package:fashion_app/screens/add_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PlaceOreder extends StatefulWidget {
  final String image;
  final int total;
  final int qty;
  final String descrp;
  final String name;
  final int price;
  const PlaceOreder({
    super.key,
    required this.image,
    required this.total,
    required this.qty,
    required this.descrp,
    required this.name,
    required this.price,
  });

  @override
  State<PlaceOreder> createState() => _PlaceOrederState();
}

class _PlaceOrederState extends State<PlaceOreder> {
  late int qtyy;
  dynamic _savedAddress;

  ///data function
  void _openaddress(c) async {
    final addressData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAddress()),
    );

    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  ///edit data function

  void _edit_address() async {
    final new_data_edit = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddAddress(edit_data: _savedAddress)),
    );

    setState(() {
      _savedAddress = new_data_edit;
    });
  }

  ///card data

  dynamic _savedCard;

  void _openCard() async {
    final card_data = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddCard()),
    );

    if (card_data != null) {
      setState(() {
        _savedCard = card_data;
      });
    }
  }

  void _edit_card() async {
    final edit_card_data = await Navigator.push(
      context,
      MaterialPageRoute(builder: (c) => AddCard(card_data_edit: _savedCard)),
    );

    _savedCard = edit_card_data;
  }

  @override
  void initState() {
    qtyy = widget.qty;
    super.initState();
  }

  ///UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: "Checkout"),
              _savedAddress != null && _savedCard != null
                  ? SizedBox.shrink()
                  : CustomText(
                      text: "Shipping address".toUpperCase(),
                      fontSize: 16,
                      colors: Colors.black38,
                    ),
              _savedAddress != null && _savedCard != null
                  ? SizedBox.shrink()
                  : Gap(10),

              ///address flow
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    _savedAddress != null
                        ? AddressFlow(data: _savedAddress, ontap: _edit_address)
                        : SizedBox.shrink(),
                    _savedAddress != null && _savedCard != null
                        ? SizedBox.shrink()
                        : Gap(20),
                    _savedAddress != null && _savedCard != null
                        ? SizedBox.shrink()
                        : GestureDetector(
                            onTap: () {
                              _openaddress(context);
                            },
                            child: CustomContainer(
                              text: "Add shipping addresss",
                              isFree: false,
                              icon: Icons.add,
                            ),
                          ),
                  ],
                ),
              ),

              ///shipping Method
              _savedAddress != null && _savedCard != null
                  ? SizedBox.shrink()
                  : ShippingMethod(),

              ///payment Method
              _savedAddress != null && _savedCard != null
                  ? SizedBox.shrink()
                  : Gap(20),
              _savedAddress != null && _savedCard != null
                  ? SizedBox.shrink()
                  : CustomText(
                      text: "payment Method".toUpperCase(),
                      fontSize: 16,
                      colors: Colors.black54,
                    ),
              Gap(15),

              _savedCard != null
                  ? Column(
                      children: [
                        Divider(color: Colors.grey.shade300),
                        Gap(20),
                        GestureDetector(
                          onTap: _edit_card,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svgs/Mastercard.svg",
                                width: 50,
                              ),
                              Gap(10),
                              CustomText(
                                text: "Master Card Ending",
                                space: 0,
                                fontSize: 14,
                                colors: app_colors.primary,
                              ),
                              Gap(10),
                              CustomText(
                                text:
                                    "••••${_savedCard["cardNumber"].toString().substring(_savedCard["cardNumber"].toString().length - 2)}",
                                colors: app_colors.primary,
                                fontSize: 14,
                              ),
                              Spacer(),
                              SvgPicture.asset("assets/svgs/arrow.svg"),
                            ],
                          ),
                        ),
                        Gap(20),
                        Divider(color: Colors.grey.shade300),
                      ],
                    )
                  // Gap(15),
                  : GestureDetector(
                      onTap: _openCard,
                      child: CustomContainer(
                        text: "select payment method",
                        isFree: false,
                        icon: Icons.keyboard_arrow_down_sharp,
                      ),
                    ),

              Gap(20),
              CartWidget(
                qty: widget.qty,
                image: widget.image,
                name: widget.name,
                price: widget.price,
                description: widget.descrp,
                onchange: (qty) {
                  setState(() {
                    qtyy = qty;
                  });
                },
              ),
              Gap(10),

              ///bottom button
              // Spacer(),
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
              CustomButton(isSvgg: true, title: "Checkout", ontapp: () {}),
              Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}
