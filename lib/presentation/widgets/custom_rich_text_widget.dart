import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/res/app_colors.dart';
import '../../core/res/ui_helper.dart';

class CustomRichText extends StatelessWidget {
  final String text1;
  final String text2;

  const CustomRichText({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: "$text1 ",
              style: customTextStyle(
                fontSize: 16.sp,
                color: AppColor.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: text2,
              style: customTextStyle(
                fontSize: 12.sp,
                color: AppColor.black ,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
