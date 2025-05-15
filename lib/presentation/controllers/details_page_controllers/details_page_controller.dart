// details_controller.dart
import 'package:astro_sagga/core/res/icons_assets.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  var gifts = [
    {"name": "Pooja", "price": "₹47"},
    {"name": "Heart", "price": "₹23"},
    {"name": "Rose Flower", "price": "₹68"},
    {"name": "Gem", "price": "₹85"},
  ].obs;

  var profileSummary =
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, to Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, to....."
          .obs;

  var specialization = "Expert in Love, Marriage, Career, Bossiness".obs;
  var languages = "Kannada, Telugu, Tamil, English, Hindi".obs;

  var timings = [
    {"image": IconsAsset.chat, "min": "10₹/min "},
    {"image": IconsAsset.call, "min": "10₹/min "},
    {"image": IconsAsset.video_call, "min": "10₹/min "},
  ].obs;
}
