import 'package:astro_sagga/core/res/app_colors.dart';
import 'package:astro_sagga/core/res/icons_assets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/models/astro_model.dart';
import '../../../data/models/astro_person_details.dart';

class AstroController extends GetxController {
  var items = <AstroModel>[].obs;
  var itemsAstro = <AstroPersonDetails>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadItems();
    loadAstroPersons();
  }

  void loadItems() {
    items.value = [
      AstroModel(icon: IconsAsset.item_1, title: "Match Making", color: AppColor.red),
      AstroModel(icon: IconsAsset.item_2, title: "Subh Muhrat", color: AppColor.pink),
      AstroModel(icon: IconsAsset.item_3, title: "Horoscope", color: AppColor.orange),
      AstroModel(icon: IconsAsset.item_4, title: "Kundali", color: AppColor.lightGreen),
      AstroModel(icon: IconsAsset.item_1, title: "Match Making", color: AppColor.red),
      AstroModel(icon: IconsAsset.item_2, title: "Subh Muhrat", color: AppColor.pink),
      AstroModel(icon: IconsAsset.item_3, title: "Horoscope", color: AppColor.orange),
      AstroModel(icon: IconsAsset.item_4, title: "Kundali", color: AppColor.lightGreen),
    ];
  }

  void loadAstroPersons() {
    itemsAstro.value = [
      AstroPersonDetails(
        name: "Rakesh Kaushik",
        rating: 4.5,
        experience: "5 yrs",
        minPrice: "₹500",
        discountPrice: "₹400",
      ),
      AstroPersonDetails(
        name: "Rakesh Kaushik",
        rating: 4.2,
        experience: "3 yrs",
        minPrice: "₹600",
        discountPrice: "₹450",
      ),
      AstroPersonDetails(
        name: "Rakesh Kaushik",
        rating: 4.5,
        experience: "5 yrs",
        minPrice: "₹500",
        discountPrice: "₹400",
      ),
      AstroPersonDetails(
        name: "Rakesh Kaushik",
        rating: 4.2,
        experience: "3 yrs",
        minPrice: "₹600",
        discountPrice: "₹450",
      ),
      AstroPersonDetails(
        name: "Rakesh Kaushik",
        rating: 4.5,
        experience: "5 yrs",
        minPrice: "₹500",
        discountPrice: "₹400",
      ),
      AstroPersonDetails(
        name: "Rakesh Kaushik",
        rating: 4.2,
        experience: "3 yrs",
        minPrice: "₹600",
        discountPrice: "₹450",
      ),
    ];
  }
}
