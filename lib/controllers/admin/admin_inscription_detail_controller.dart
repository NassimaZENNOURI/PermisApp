
import 'package:get/get.dart';
import 'package:permisapp/utils/models/Inscription.dart';

import '../../utils/models/school.dart';

class AdminInscriptionDetailController extends GetxController{
  Inscription data =Inscription();
  Schools school = Schools();


  @override
  void onInit() {
    data = Get.arguments.first ;
    update();
    school.name = data.fullname;
    school.email = data.email;
    school.address= data.address;
    school.school_name= data.schoolName;
    school.id= data.id;
    school.phoneNo=data.phoneNo;
    school.city= data.city;
    school.status= data.status.toString();
    update();
    super.onInit();
  }
}