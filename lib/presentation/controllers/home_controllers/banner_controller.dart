import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'banner_model.dart';

class BannerController extends GetxController {
  // List of banners
  final items = <BannerItem>[
    BannerItem(name: 'Rakesh Kaushik', comment: 'Explore your zodiac and cosmic insights live!', views: '13k'),
    BannerItem(name: 'Rakesh Kaushik', comment: 'Explore your zodiac and cosmic insights live!', views: '13k'),
    BannerItem(name: 'Rakesh Kaushik', comment: 'Explore your zodiac and cosmic insights live!', views: '13k'),
  ].obs;

  final currentPage = 0.obs;

  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.9)
      ..addListener(() {
        final page = pageController.page?.round() ?? 0;
        currentPage.value = page;
      });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
