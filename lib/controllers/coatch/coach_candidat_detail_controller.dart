
import 'package:get/get.dart';

import '../../utils/models/Candidat.dart';

class CoachCandidatDetailController extends GetxController{

  Candidat candidat = Candidat();
  var payer = 0;
  var reste = 0;


  @override
  void onInit() {
    super.onInit();
    candidat = Get.arguments.first ;
    update();
    payer = candidat.paid! ;
    reste = candidat.tarifs! - payer ;
    update();
  }

}