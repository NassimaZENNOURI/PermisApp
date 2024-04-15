
import 'package:get/get.dart';

import '../../utils/models/Candidat.dart';

class SchoolCandidatDetailController extends GetxController{

  Candidat candidat = Candidat();
  int payer = 0;
  int reste = 0 ;

  @override
  void onInit() {
    candidat = Get.arguments.first ;
    payer = candidat.paid! ;
    reste = candidat.tarifs! - payer! ;
    update();
    super.onInit();
  }

}