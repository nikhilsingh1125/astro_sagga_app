import 'package:astro_sagga/core/res/app_colors.dart';
import 'package:astro_sagga/core/res/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/home_controllers/banner_controller.dart';

class BannerSlider extends StatelessWidget {
  final BannerController ctrl = Get.put(BannerController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115.h,
          child: PageView.builder(
            controller: ctrl.pageController,
            itemCount: ctrl.items.length,
            itemBuilder: (context, index) {
              final item = ctrl.items[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.silver,
                        AppColor.darkSilver,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          item.comment,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white,
                            fontFamily: "Poppins",
                            shadows: [
                              Shadow(
                                blurRadius: 8,
                                color: AppColor.black.withOpacity(0.3),
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            height: 36.w,
                            width: 36.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: SizedBox(),
                          ),
                          SizedBox(width: 10.w),
                          // Name
                          Text(
                            item.name,
                            style: customTextStyle(fontSize: 12,fontFamily: "Poppins",color: AppColor.white,fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.remove_red_eye, color: Colors.white, size: 16),
                                SizedBox(width: 4.w),
                                Text(
                                  item.views,
                                  style: customTextStyle(fontSize: 12,fontFamily: "Poppins",color: AppColor.white,fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
