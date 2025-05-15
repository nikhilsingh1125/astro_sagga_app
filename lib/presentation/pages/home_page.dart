import 'package:astro_sagga/core/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/res/icons_assets.dart';
import '../../core/res/ui_helper.dart';
import '../controllers/home_controllers/astro_controller.dart';
import '../controllers/home_controllers/bottom_nav_controller.dart';
import '../widgets/banner_widget.dart';
import 'details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AstroController controller = Get.put(AstroController());
  final BottomNavController navController = Get.put(BottomNavController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: SvgPicture.asset(
            IconsAsset.logo,
            height: 20.h,
            width: 20.h,
          ),
        ),
        actions: [
          SvgPicture.asset(
            IconsAsset.search,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(
            width: 15.h,
          ),
          SvgPicture.asset(
            IconsAsset.notification,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(
            width: 15.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 7.h),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColor.darkGrey),
                shape: BoxShape.rectangle),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    IconsAsset.wallet,
                    height: 24.h,
                    width: 24.h,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "100 ₹",
                    style: customTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: AppColor.darkGrey,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 15.h,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 6.h,
              ),
              Obx(
                () => SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      final item = controller.items[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: item.color,
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              width: 53.w,
                              height: 54.w,
                              child: Padding(
                                padding: EdgeInsets.all(12.w),
                                child: SvgPicture.asset(item.icon),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(item.title,
                                style: customTextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Inter',
                                  color: AppColor.darkGrey,
                                )),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              BannerSlider(),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Our Experts",
                        style: customTextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: AppColor.black,
                        )),
                    SvgPicture.asset(IconsAsset.filter)
                  ],
                ),
              ),
              Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(12.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 0.90,
                  ),
                  itemCount: controller.itemsAstro.length,
                  itemBuilder: (context, index) {
                    final item = controller.itemsAstro[index];
                    return InkWell(
                      onTap: (){
                        Get.to(DetailsPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6.r,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 45.w,
                                        width: 45.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        child: const SizedBox(),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          width: 10.w,
                                          height: 10.w,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 6.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rating : ",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey),
                                      ),
                                      Icon(Icons.star,
                                          color: Colors.orange, size: 14.sp),
                                      SizedBox(width: 4.w),
                                      Text(
                                        "${item.rating}",
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 6.h),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.grey),
                                      children: [
                                        const TextSpan(text: "Exp : "),
                                        TextSpan(
                                          text: "${item.experience} years",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 6.h),
                              decoration: BoxDecoration(
                                color: AppColor.lightBlue,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.r),
                                  bottomRight: Radius.circular(12.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "${item.discountPrice}₹/min",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${item.minPrice}₹/min",
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTabItem(icon: IconsAsset.home, label: "Home", index: 0),
              buildTabItem(icon: IconsAsset.course, label: "Courses", index: 1),
              buildTabItem(icon: IconsAsset.shop, label: "Shop", index: 1),
              buildTabItem(
                  icon: IconsAsset.profile, label: "Profile", index: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTabItem(
      {required String icon, required String label, required int index}) {
    final isSelected = navController.currentIndex.value == index;
    return GestureDetector(
      onTap: () => navController.changeTabIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, color: isSelected ? Colors.blue : Colors.grey),
          SizedBox(height: 4.h),
          Text(
              label,
              style: customTextStyle(fontSize: 12,color: isSelected ? Colors.blue : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,)
          )
        ],
      ),
    );
  }
}
