
import 'package:get/get.dart';
import '../../utils/models/Candidat.dart';

class CoachSeanceDetailController extends GetxController{

  List<Candidat> candidats = [] ;



  @override
  void onInit() {
    candidats = Get.arguments.first;
    update();
    super.onInit();
  }

}