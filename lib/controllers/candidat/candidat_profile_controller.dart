
import 'package:get/get.dart';

import '../../utils/models/Candidat.dart';

class CandidatProfileController extends GetxController{

  Candidat candidat = Candidat();

  @override
  void onInit() {
    candidat = Get.arguments.first;
    update();
    super.onInit();
  }

}