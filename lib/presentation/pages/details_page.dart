import 'package:astro_sagga/core/res/app_colors.dart';
import 'package:astro_sagga/core/res/icons_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/res/ui_helper.dart';
import '../controllers/details_page_controllers/details_page_controller.dart';
import '../widgets/custom_rich_text_widget.dart';

class DetailsPage extends StatelessWidget {
  final DetailsController controller = Get.put(DetailsController());

  DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          backgroundColor: AppColor.darkBlue,
          leading: const BackButton(),
          title: Row(
            children: [
              Text("Rakesh Kaushik",
                  style: customTextStyle(
                      fontSize: 16,
                      color: AppColor.white,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 10.w),
              Container(
                width: 10.w,
                height: 10.w,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
          actions: [
            SvgPicture.asset(IconsAsset.share),
            SizedBox(width: 30.w),
            SvgPicture.asset(IconsAsset.menu),
            SizedBox(width: 30.w),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAstroProfile(),
            SizedBox(height: 16.h),
            _buildTopCard(),
            SizedBox(height: 16.h),
            _buildImagesSection(),
            SizedBox(height: 16.h),
            _buildSendGifts(),
            SizedBox(height: 16.h),
            _buildProfileSummary(),
            SizedBox(height: 16.h),
            _buildSpecializationLanguages(),
            SizedBox(height: 16.h),
            _buildChatWithAssistant(),
            SizedBox(height: 16.h),
            _buildUserReview(),
            SizedBox(height: 90.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomOptions(),
    );
  }

  Widget _buildAstroProfile() {
    return Center(
      child: SizedBox(
        width: 161.w,
        height: 168.h,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text("Rakesh Kaushik",
              style: customTextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }

  Widget _buildTopCard() {
    return Card(
      elevation: 1,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r)),
              color: AppColor.blue,
            ),
            child: Row(
              children: [
                SvgPicture.asset(IconsAsset.rating),
                SizedBox(width: 6.w),
                const CustomRichText(
                  text1: '4.2',
                  text2: 'Rating',
                ),
                SizedBox(width: 10.w),
                const CustomRichText(
                  text1: '10',
                  text2: 'Experience',
                ),
                SizedBox(width: 10.w),
                const CustomRichText(
                  text1: '10k',
                  text2: 'Followers',
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r)),
              color: AppColor.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(IconsAsset.chat),
                    SizedBox(width: 6.w),
                    const CustomRichText(
                      text1: '9k',
                      text2: 'mins',
                    ),
                    SizedBox(width: 16.w),
                    SvgPicture.asset(IconsAsset.call),
                    SizedBox(width: 6.w),
                    const CustomRichText(
                      text1: '22k',
                      text2: 'mins',
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColor.darkBlue),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                    child: Text("Follow",
                        style: customTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.orange)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Images",
            style: customTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.black)),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (_) {
            return SvgPicture.asset(IconsAsset.images_items);
          }),
        ),
      ],
    );
  }

  Widget _buildSendGifts() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Send Gifts",
                style: customTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                )),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: controller.gifts.map((gift) {
                return Column(
                  children: [
                    SvgPicture.asset(IconsAsset.gifts_items),
                    SizedBox(height: 4.h),
                    Text(gift['name']!,
                        style: customTextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        )),
                    Text(gift['price']!,
                        style: customTextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColor.black,
                        )),
                  ],
                );
              }).toList(),
            )
          ],
        ));
  }

  Widget _buildProfileSummary() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile Summary",
                style: customTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                )),
            SizedBox(height: 6.h),
            Text(
              controller.profileSummary.value,
              style: customTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.darkGreyColor,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Read More",
                  style: customTextStyle(fontSize: 14, color: Colors.blue)),
            )
          ],
        ));
  }

  Widget _buildSpecializationLanguages() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Specialization",
                style: customTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                )),
            Text(controller.specialization.value,
                style: customTextStyle(
                    fontSize: 14, color: AppColor.darkGreyColor)),
            SizedBox(height: 8.h),
            Text("Languages",
                style: customTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                )),
            Text(controller.languages.value,
                style: customTextStyle(
                    fontSize: 14, color: AppColor.darkGreyColor)),
          ],
        ));
  }

  Widget _buildChatWithAssistant() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          SvgPicture.asset(IconsAsset.support),
          SizedBox(width: 10.w),
          Text("Chat With Assistant",
              style: customTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.black,
              )),
          const Spacer(),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }

  Widget _buildUserReview() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomRichText(
          text1: 'Users Review',
          text2: '(400 peoples)',
        ),
        TextButton(
          onPressed: () {},
          child: Text("View all",
              style: customTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.darkBlue,
              )),
        )
      ],
    );
  }

  Widget _buildBottomOptions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: controller.timings.map((gift) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(gift['image']!, color: AppColor.white),
                  SizedBox(height: 4.h),
                  Text(
                    gift['min']!,
                    style: customTextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
