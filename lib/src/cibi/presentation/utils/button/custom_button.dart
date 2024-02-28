import 'package:cibi/src/constants.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  String text;
  double width;
  var onTap;
  CustomButtom(
      {super.key,
      required this.text,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
