import 'dart:async';
import 'package:fashion_app/components/custom_appbar.dart';
import 'package:fashion_app/components/custom_text.dart';
import 'package:fashion_app/core/colors.dart';
import 'package:fashion_app/models/cover_model.dart';
import 'package:fashion_app/models/product_model.dart';
import 'package:fashion_app/screens/check_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late PageController _pageController;
  int _currentPage = 1000;  
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.6,
      initialPage: _currentPage,  
    );

  
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.primary,
      appBar: CustomAppbar(isBlack: true),
      body: Stack(
        children: [
          /// النصوص زي ما هي
          Positioned(
            top: 17,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/texts/10.svg'),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/texts/October.svg'),
          ),
          Positioned(
            top: 85,
            left: 0,
            right: 0,
            child: SvgPicture.asset('assets/texts/Collection.svg'),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Gap(120),
                      Image.asset("assets/cover/cover1.png"),
                      Gap(20),

                      /// grid view زي ما هي
                      GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.44,
                        ),
                        itemCount: ProductModel.products.length,
                        itemBuilder: (context, index) {
                          final item = ProductModel.products[index];
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckOut(
                                  image: item.image,
                                  name: item.name,
                                  price: item.price,
                                  description: item.description,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(item.image),
                                Gap(20),
                                CustomText(text: item.name),
                                CustomText(
                                  text: item.description,
                                  fontSize: 13,
                                  colors: Colors.grey,
                                ),
                                Gap(9),
                                CustomText(
                                  text: "\$ ${item.price.toString()}",
                                  fontSize: 20,
                                  colors: Colors.red.shade200,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Gap(5),
                      CustomText(
                        text: "you may also like".toUpperCase(),
                        fontSize: 23,
                      ),
                      Gap(15),

                      Image.asset("assets/svgs/line.png", width: 180),
                      Gap(45),

                      
                      SizedBox(
                        height: 400,
                        child: PageView.builder(
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            final realIndex =
                                index % CoverModel.covers.length; 
                            return AnimatedBuilder(
                              animation: _pageController,
                              builder: (context, child) {
                                double value = 1.0;
                                if (_pageController.position.haveDimensions) {
                                  value = (_pageController.page! - index).abs();
                                  value = (1 - (value * 0.3)).clamp(0.8, 1.0);
                                }
                                return Center(
                                  child: Transform.scale(
                                    scale: value,
                                    child: child,
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    CoverModel.covers[realIndex].image,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  Gap(10),
                                  CustomText(
                                    text: CoverModel.covers[realIndex].name
                                        .toUpperCase(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      /// -------------------------------------------------
                      Gap(60),
                      about(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30, top: 10),
                  width: double.infinity,
                  color: Colors.grey.shade400,
                  child: Center(
                    child: CustomText(
                      height: 2.5,
                      text: "Copyright© OpenUI All Rights Reserved.",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget about() {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.logo_instagram, color: Colors.white),
            Gap(30),
            Icon(Ionicons.logo_twitter, color: Colors.white),
            Gap(30),
            Icon(Ionicons.logo_facebook, color: Colors.white),
          ],
        ),
        Gap(20),
        Image.asset("assets/svgs/line.png", width: 150),
        Gap(20),
        CustomText(
          max: 3,
          height: 2.5,
          text:
              "support@openui.design \n       +60 825 876 \n88:88 - 22:00 - Everyday",
        ),
        Gap(20),
        Image.asset("assets/svgs/line.png", width: 150),
        Gap(20),
        CustomText(text: "About      Contact      Blog"),
        Gap(20),
      ],
    ),
  );
}
