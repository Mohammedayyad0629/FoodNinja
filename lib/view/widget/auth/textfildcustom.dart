import 'package:flutter/material.dart';

import '../iconsgradient.dart';

class TextFildCustom extends StatelessWidget {
  final bool? obscure;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  // final Widget? suffix ;
  final Widget? prefix;
  final String? Function(String?) valid;
  final String hinttext;
  final IconData icon;
  final TextEditingController mycontroller;
  const TextFildCustom(
      {Key? key,
      required this.hinttext,
      required this.icon,
      required this.mycontroller,
      this.prefix,
      required this.valid,
      required this.keyboardType,
      required this.textInputAction,
      this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 57,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(5, 0, 0, 0),
            spreadRadius: 0,
            blurRadius: 400,
            offset: Offset(0, 0)),
      ]),
      child: TextFormField(
        obscureText: obscure == null || obscure == false ? false : true,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: valid,
        controller: mycontroller,
        style: Theme.of(context).textTheme.displaySmall,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: GradientColor(
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          suffixIcon: prefix,
          hintText: hinttext,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          contentPadding: const EdgeInsets.only(left: 5, right: 5),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
