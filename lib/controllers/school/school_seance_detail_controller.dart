
import 'package:get/get.dart';

import '../../utils/models/Candidat.dart';

class SchoolSeanceDetailController extends GetxController{

  List<Candidat> candidats = [] ;



  @override
  void onInit() {
    candidats = Get.arguments.first;
    update();
    super.onInit();
  }

}