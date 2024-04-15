import 'package:app_settings/app_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../Components/appVars.dart';
import '../components/widgets.dart';
import '../controllers/admin/login_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [firstGrad, secondGrad],
              stops: [0.5, 1.0],
            ),
          ),
        ),
        elevation: 0,
        title: const Text('settings', style: TextStyle(color: Colors.white),).tr(),
      ),
      body: Center(
        child: Column(
          children: [
            20.verticalSpace,
            SettingsMenuWidget(
              icon: Icons.notifications,
              title: tr('Open'),
              onPress: (){
                AppSettings.openNotificationSettings();
              },
            ),
            10.verticalSpace,
            GetBuilder<LoginController>(
              init: LoginController(),
              builder:(controller)=> SettingsMenuWidget(
                icon: Icons.language,
                title: 'تغيير اللغة',
                onPress: (){
                  controller.changeToArabic(context);
                },
              ),
            ),
            10.verticalSpace,
            GetBuilder<LoginController>(
              init: LoginController(),
              builder:(controller)=> SettingsMenuWidget(
                icon: Icons.language,
                title: 'Changer la langue',
                onPress: (){
                  controller.changeToFrench(context);
                },
              ),
            ),
            10.verticalSpace,
            // Row(
            //       children: [
            //         const Spacer(),
            //         Container(
            //           decoration: BoxDecoration(
            //             gradient: const LinearGradient(
            //               colors: [firstGrad, secondGrad],
            //               stops: [0.5, 1.0],
            //             ),
            //             border: Border.all(color: PrimaryColor, width: 1.2.w),
            //             borderRadius: BorderRadius.all(Radius.circular(12.r)),
            //           ),
            //           child: GetBuilder<LoginController>(
            //             init: LoginController(),
            //             builder:(controller) => ElevatedButton(
            //               onPressed: () {
            //                   controller.changeToArabic(context);
            //               },
            //               child: const Text('تغيير اللغة',style: TextStyle(color: PrimaryColor),),
            //             ),
            //           ),
            //         ),
            //         const Spacer(),
            //         Container(
            //           decoration: BoxDecoration(
            //             gradient:  const LinearGradient(
            //               colors: [firstGrad, secondGrad],
            //               stops: [0.5, 1.0],
            //             ),
            //             border: Border.all(color: PrimaryColor, width: 1.2.w),
            //             borderRadius: BorderRadius.all(Radius.circular(12.r)),
            //           ),
            //           child: GetBuilder<LoginController>(
            //             init: LoginController(),
            //             builder:(controller)=> ElevatedButton(
            //               onPressed: () {
            //                 controller.changeToFrench(context);
            //               },
            //               child: const Text('Changer la langue',style: TextStyle(color: PrimaryColor),),
            //             ),
            //           ),
            //         ),
            //         const Spacer(),
            //       ],
            //     ),
          ],
        ),
      ),
    );
  }
}
