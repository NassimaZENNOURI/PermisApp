
import 'package:get/get.dart';

import '../../utils/models/Candidat.dart';

class AdminCandidatDetailController extends GetxController{

  Candidat candidat = Candidat();
  int paid = 0 ;
  int reste = 0 ;

  @override
  void onInit() {
    candidat = Get.arguments.first ;
    paid = candidat.paid! ;
    reste = candidat.tarifs! - paid ;
    update();
    super.onInit();
  }
}