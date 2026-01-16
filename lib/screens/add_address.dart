import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/components/custom_button.dart';
import 'package:fashion_app/components/custom_text_field.dart';
import 'package:fashion_app/components/header.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddAddress extends StatefulWidget {
  final dynamic edit_data;
  const AddAddress({super.key, this.edit_data});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.edit_data != null) {
      firstNameController.text = widget.edit_data["first"] ?? "";
      lastNameController.text = widget.edit_data["last"] ?? "";
      addressController.text = widget.edit_data["address"] ?? "";
      cityController.text = widget.edit_data["city"] ?? "";
      zipCodeController.text = widget.edit_data["zip"] ?? "";
      stateController.text = widget.edit_data["state"] ?? "";
      phoneController.text = widget.edit_data["phone"] ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(title: "Add Shipping Address"),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hint: "First Name",
                            controller: firstNameController,
                          ),
                        ),
                        Gap(14),
                        // const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            hint: "Last Name",
                            controller: lastNameController,
                          ),
                        ),
                      ],
                    ),

                    Gap(20),
                    CustomTextField(
                      hint: 'Address',
                      controller: addressController,
                    ),
                    Gap(20),
                    CustomTextField(hint: 'City', controller: cityController),
                    Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hint: "State",
                            controller: stateController,
                          ),
                        ),
                        Gap(14),
                        // const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            hint: "ZIP Code",
                            controller: zipCodeController,
                          ),
                        ),
                      ],
                    ),

                    Gap(20),
                    CustomTextField(
                      hint: "Phone Number",
                      controller: phoneController,
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Gap(200),
              CustomButton(
                isSvgg: true,
                title: "Checkout",
                ontapp: () {
                  if (_formkey.currentState!.validate()) {
                    return;
                  } else {
                    final data = {
                      "first": firstNameController.text,
                      "last": lastNameController.text,
                      "address": addressController.text,
                      "city": cityController.text,
                      "phone": phoneController.text,
                      "zip": zipCodeController.text,
                      "state": stateController.text,
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
    );
  }
}
