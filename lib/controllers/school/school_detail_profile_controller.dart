
import 'package:get/get.dart';
import 'package:permisapp/utils/models/school.dart';

class SchoolDetailProfileController extends GetxController{

  Schools school =Schools();

  @override
  void onInit() {
    school = Get.arguments.first ;
    update();
    super.onInit();
  }

}