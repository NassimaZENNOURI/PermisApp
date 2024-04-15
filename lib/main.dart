import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permisapp/utils/services.dart';
import 'apiFunctions/Functions.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  Widget? main;
  await Functions.initOneSignal();
  await initWidget().then(
        (value) {
      main = value;
    },
  );


  runApp(
    EasyLocalization(
      supportedLocales:const [  Locale('fr'),  Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('fr'),
      startLocale: const Locale("fr"),
      child: ScreenUtilInit(
        designSize: const Size(359, 744),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return GetMaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'DabaPermis',
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'cairo',

            ),
            home: main,
          );
        },
      ),
    ),
  );}