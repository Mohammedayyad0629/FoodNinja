import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class SearchHome extends StatelessWidget {
  final void Function() onsearch;
  final void Function() onfilter;
  final String titlesearch;
  final TextEditingController mycontroller;
  final Function(String) onChanged;
  const SearchHome(
      {Key? key,
      required this.onsearch,
      required this.onfilter,
      required this.titlesearch,
      required this.mycontroller,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 50,
            child: TextFormField(
              controller: mycontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  prefixIcon: InkWell(
                      onTap: onsearch, child: Image.asset(ImageAsset.search)),
                  hintText: titlesearch,
                  hintStyle: const TextStyle(
                      color: AppColor.hintsearchcolor, fontSize: 12),
                  filled: true,
                  fillColor: AppColor.fillcolor,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12))),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: onfilter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                    color: AppColor.fillcolor,
                    borderRadius: BorderRadius.circular(12)),
                child: Image.asset(ImageAsset.filter),
              ),
            ))
      ],
    );
  }
}
