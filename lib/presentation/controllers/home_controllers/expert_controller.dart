// presentation/controllers/expert_controller.dart
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/models/expert_model.dart';

class ExpertController extends GetxController {
  final experts = <ExpertModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadExperts();
  }

  void loadExperts() {
    experts.assignAll(List.generate(
      6,
          (index) => ExpertModel(
        name: 'Rakesh Kaushik',
        rating: 4.7,
        experience: 10,
        ratePerMinute: 102,
      ),
    ));
  }
}
