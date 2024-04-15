
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  bool val = false;

  changeToFrench(BuildContext context){
    context.locale = Locale('fr', '');
    update();
  }
  changeToArabic(BuildContext context){
    context.locale = Locale('ar', '');
    update();
  }

}