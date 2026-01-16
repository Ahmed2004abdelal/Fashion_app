import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/components/custom_button.dart';
import 'package:fashion_app/components/header.dart';
import 'package:fashion_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';

class AddCard extends StatefulWidget {
  final dynamic card_data_edit;
  const AddCard({super.key, this.card_data_edit});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool CVVShow = false;

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.card_data_edit != null) {
      cardNumber = widget.card_data_edit["cardNumber"] ?? "";
      cardHolderName = widget.card_data_edit["CardName"] ?? "";
      expiryDate = widget.card_data_edit["date"] ?? "";
      cvvCode = widget.card_data_edit["cvv"] ?? "";
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppbar(isBlack: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: "Payment method"),
                Gap(11),

                ///visa pack
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: CVVShow,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: app_colors.primary,
                  obscureCardNumber: true, // خليه false عشان تشوف الأرقام
                  obscureCardCvv: true, // خليه false عشان تشوف الـ CVV
                  isHolderNameVisible: true,
                ),

                ///form
                CreditCardForm(
                  formKey: _key,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditcardModelChange,
                  autovalidateMode: AutovalidateMode.always, // <<< ضيف دي
                  isCardHolderNameUpperCase: true,
                ),

                // Spacer(),
                Gap(70),
                CustomButton(
                  isSvgg: false,
                  title: "add card",
                  ontapp: () {
                    if (_key.currentState!.validate()) {
                      final data = {
                        "cardNumber": cardNumber,
                        "CardName": cardHolderName,
                        "date": expiryDate,
                        "cvv": cvvCode,
                      };
                      Navigator.pop(context, data);
                    }
                  },
                ),
                Gap(60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditcardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      expiryDate = data.expiryDate;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      CVVShow = data.isCvvFocused;
    });
  }
}
