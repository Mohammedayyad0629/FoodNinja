import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodninja/data/datasource/static/discountoffers.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class OfferSlider extends StatelessWidget {
  const OfferSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        width: double.infinity,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16 / 9,
            viewportFraction: 1.000,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) =>
              Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    colors: [AppColor.green1, AppColor.green2])),
            child: Stack(children: [
              Positioned(child: SvgPicture.asset(ImageAsset.pattern4)),
              SizedBox(
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      discountOffers[index].image!,
                      width: 150,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          discountOffers[index].title!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 17, color: AppColor.white),
                        ),
                        Text(discountOffers[index].body),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: AppColor.white,
                          onPressed: () {},
                          child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) => const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        AppColor.green1,
                                        AppColor.green2
                                      ]).createShader(bounds),
                              child: const Text("Buy")),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
          itemCount: discountOffers.length,
        ));
  }
}
