
import 'package:get/get.dart';
import '../../utils/models/school.dart';

class AdminSchoolDetailController extends GetxController{

  Schools school = Schools();

  @override
  void onInit() {
    school = Get.arguments.first ;
    update();
    super.onInit();
  }

}