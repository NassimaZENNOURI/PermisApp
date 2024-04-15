
import 'package:get/get.dart';
import 'package:permisapp/utils/models/Moniteur.dart';

class SchoolCoachDetailController extends GetxController{

  Moniteur coach = Moniteur();


  @override
  void onInit() {
    coach = Get.arguments.first ;
    update();
    super.onInit();
  }

}