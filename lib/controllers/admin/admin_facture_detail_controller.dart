
import 'package:get/get.dart';

import '../../utils/models/Facture.dart';

class AdminFactureDetailController extends GetxController{

  Facture facture = Facture();


  @override
  void onInit() {
    facture = Get.arguments.first ;
    update();
    super.onInit();
  }

}