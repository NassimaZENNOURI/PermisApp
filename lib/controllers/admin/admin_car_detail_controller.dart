
import 'package:get/get.dart';
import '../../utils/models/Cars.dart';

class AdminCarDetailController extends GetxController{

  Cars car = Cars();

  @override
  void onInit() {
    car = Get.arguments.first ;
    update();
    super.onInit();
  }
}