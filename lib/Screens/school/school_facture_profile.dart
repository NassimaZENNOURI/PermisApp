import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/school/school_home_screen.dart';
import '../../Components/appVars.dart';
import '../../Components/functions.dart';
import '../../controllers/school/school_facture_profile_controller.dart';
class SchoolFactureProfile extends StatelessWidget {
  const SchoolFactureProfile({super.key});

  @override
  Widget build(BuildContext context) {
    bool isar = true;
    String curr = Localizations.localeOf(context).toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            color: Colors.white,
            !isar
                ? IconlyBroken.arrow_left_2
                : IconlyBroken.arrow_right_2,
            size: 30.h,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0.w),
            child: Transform.scale(
              scale: 1.8,
              child: IconButton(
                icon: Image.asset(
                  height: 44.h,
                  'assets/images/logo.png',
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [firstGrad, secondGrad],
              stops: [0.5, 1.0],
            ),
          ),
        ),
        toolbarHeight: 80.h,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Column(children: [
              17.verticalSpace,
              17.verticalSpace,
              Text(
                "onefacture",
                style: TextStyle(
                    color: PrimaryColor,
                    fontFamily: 'cairo',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  decorationColor: PrimaryColor,
                ),
              ).tr(),
              10.verticalSpace,
              GetBuilder<SchoolFactureProfileController>(
                init: SchoolFactureProfileController(),
                builder:(controller)=> Text(
                  controller.facture.name.toString(),
                  style: TextStyle(
                      color: PrimaryColor,
                      fontFamily: 'cairo',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  const Text('email', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                  const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                ],
              ),
              GetBuilder<SchoolFactureProfileController>(
                init: SchoolFactureProfileController(),
                builder:(controller)=> TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 25.w),
                    hintText: controller.facture.email,
                    suffixIcon: const Icon(Icons.email, color: Gry3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Gry3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Row(
                children: [
                  const Text('fullname', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                  const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                ],
              ),
              GetBuilder<SchoolFactureProfileController>(
                builder:(controller)=> TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 25.w),
                    hintText: controller.facture.name,
                    suffixIcon: const Icon(Icons.person, color: Gry3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Gry3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Row(
                children: [
                  const Text('montanttotale', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                  const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                ],
              ),
              GetBuilder<SchoolFactureProfileController>(
                builder:(controller)=>  TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 25.w),
                    hintText: '${controller.facture.montant} Dh',
                    suffixIcon: const Icon(Icons.attach_money, color: Gry3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Gry3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Row(
                children: [
                  const Text('montantpaye', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                  const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                ],
              ),
              GetBuilder<SchoolFactureProfileController>(
                builder:(controller)=>  TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 25.w),
                    hintText: '${controller.facture.montantpaye} Dh',
                    suffixIcon: const Icon(Icons.attach_money, color: Gry3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Gry3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Row(
                children: [
                  const Text('montantreste', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                  const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                ],
              ),
              GetBuilder<SchoolFactureProfileController>(
                builder:(controller)=>  TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 25.w),
                    hintText: '${controller.facture.montantreste} Dh',
                    suffixIcon: const Icon(Icons.attach_money, color: Gry3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Gry3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Row(
                children: [
                  const Text('createdat', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                  const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                ],
              ),
              GetBuilder<SchoolFactureProfileController>(
                builder:(controller)=>  TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h ,horizontal: 25.w),
                    hintText: controller.facture.createdAt.toString().split(':')[0],
                    suffixIcon: const Icon(Icons.date_range_sharp, color: Gry3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Gry3)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Gry3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              // 10.verticalSpace,
              // Row(
              //   children: [
              //     const Text('type', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
              //     const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
              //   ],
              // ),
              // GetBuilder<SchoolFactureProfileController>(
              //   builder:(controller)=>  TextField(
              //     readOnly: true,
              //     decoration: InputDecoration(
              //       contentPadding: EdgeInsets.symmetric(vertical: 12.h , horizontal: 25.w),
              //       hintText: controller.facture.type.toString(),
              //       suffixIcon: const Icon(Icons.payment, color: Gry3),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12.r),
              //           borderSide: const BorderSide(color: Gry3)),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(12.r),
              //           borderSide: const BorderSide(color: Gry3)),
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Gry3),
              //         borderRadius: BorderRadius.circular(12.r),
              //       ),
              //     ),
              //   ),
              // ),
              10.verticalSpace,
              12.verticalSpace,
              GetBuilder<SchoolFactureProfileController>(
                init: SchoolFactureProfileController(),
                builder:(controller)=> ElevatedButton(
                  child: Text('delete'),
                      onPressed: () {
                    DeletePopup(context, StringTranslateExtension('deleteaccount').tr(), controller.facture.id! , 'facture', const SchoolHomeScreen());
                  },

                ),
              ),
            ]),
          )),
    );
  }
}
