
import 'package:get/get.dart';

import '../../utils/models/Candidat.dart';

class SeanceDetailController extends GetxController{

  List<Candidat> candidats = [] ;


  getSeancesId(){

  }


  @override
  void onInit() {
    candidats = Get.arguments.first;
    update();
    super.onInit();
  }

}