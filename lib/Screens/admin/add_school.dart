import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Components/appVars.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Components/widgets.dart';
import '../../controllers/admin/school_add_controller.dart';

class AddSchool extends StatelessWidget {
  const AddSchool({super.key});

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
          decoration: const BoxDecoration(
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
        child: Column(
          children: [
            25.verticalSpace,
            Text(
              "addschool",
              style: TextStyle(
                  color: PrimaryColor,
                  fontFamily: 'cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: secondGrad
              ),
            ).tr(),
            17.verticalSpace,
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  GetBuilder<AddSchoolController>(
                    init: AddSchoolController(),
                    builder: (controller)=> TextField(
                      style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                      readOnly: false,
                      controller: controller.nameController,
                      obscureText:  false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.perm_identity),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        focusColor: PrimaryColor,
                        labelText:  StringTranslateExtension('fullname').tr(),
                        labelStyle: TextStyle(
                            color: gray,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cairo",
                            fontSize: 14.sp
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.9.w,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: const BorderSide(
                              color: Gry3,
                              width: 1.9,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.9,
                            )
                        ),
                      ),
                    ),
                    //     PrimaryTextField(
                    //   hintText: 'fullname'.tr()  ,
                    //   controller: controller.nameController,
                    //     prefixIcon: const Icon(Icons.perm_identity),
                    //     visibility: false,centered: false,
                    // ),
                  ),
                  20.verticalSpace,
                  GetBuilder<AddSchoolController>(
                    init: AddSchoolController(),
                    builder: (controller)=> TextField(
                      style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                      readOnly: false,
                      controller: controller.schoolnameController,
                      obscureText:  false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.home_work_outlined),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        focusColor: PrimaryColor,
                        labelText:  StringTranslateExtension('schoolname').tr(),
                        labelStyle: TextStyle(
                            color: gray,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cairo",
                            fontSize: 14.sp
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.9.w,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: const BorderSide(
                              color: Gry3,
                              width: 1.9,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.9,
                            )
                        ),
                      ),
                    ),
                      //   PrimaryTextField(hintText: 'schoolname'.tr()  ,controller: controller.schoolnameController ,
                      // prefixIcon: const Icon(Icons.home_work_outlined),
                      // visibility: false,centered: false,
                      //   ),
                  ),
                  20.verticalSpace,
                  GetBuilder<AddSchoolController>(
                    init: AddSchoolController(),
                    builder: (controller)=> TextField(
                      style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                      readOnly: false,
                      controller: controller.emailController,
                      obscureText:  false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        focusColor: PrimaryColor,
                        labelText:  StringTranslateExtension('email').tr(),
                        labelStyle: TextStyle(
                            color: gray,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cairo",
                            fontSize: 14.sp
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.9.w,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: const BorderSide(
                              color: Gry3,
                              width: 1.9,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.9,
                            )
                        ),
                      ),
                    ),
                      //   PrimaryTextField(hintText: 'email'.tr()  ,controller: controller.emailController ,
                      // prefixIcon: const Icon(Icons.email),
                      // visibility: false,centered: false,
                      //   ),
                  ),
                  20.verticalSpace,
                  GetBuilder<AddSchoolController>(
                    init: AddSchoolController(),
                    builder: (controller)=> TextField(
                      style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                      readOnly: false,
                      controller: controller.cityController,
                      obscureText:  false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.home_work_outlined),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        focusColor: PrimaryColor,
                        labelText:  StringTranslateExtension('city').tr(),
                        labelStyle: TextStyle(
                            color: gray,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cairo",
                            fontSize: 14.sp
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.9.w,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: const BorderSide(
                              color: Gry3,
                              width: 1.9,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.9,
                            )
                        ),
                      ),
                    ),
                      //   PrimaryTextField(hintText: 'city'.tr()  ,controller: controller.cityController ,
                      // prefixIcon: const Icon(Icons.location_city),
                      // visibility: false,centered: false,),
                  ),
                  20.verticalSpace,
                  GetBuilder<AddSchoolController>(
                    init: AddSchoolController(),
                    builder: (controller)=> TextField(
                      style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                      readOnly: false,
                      controller: controller.addressController,
                      obscureText:  false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.home_work_outlined),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        focusColor: PrimaryColor,
                        labelText:  StringTranslateExtension('schooladdress').tr(),
                        labelStyle: TextStyle(
                            color: gray,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cairo",
                            fontSize: 14.sp
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.9.w,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: const BorderSide(
                              color: Gry3,
                              width: 1.9,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.9,
                            )
                        ),
                      ),
                    ),
                      //   PrimaryTextField(hintText: 'schooladdress'.tr()  ,controller: controller.addressController ,
                      // prefixIcon: const Icon(Icons.home_work_outlined),
                      // visibility: false,centered: false,),
                  ),
                  20.verticalSpace,
                  GetBuilder<AddSchoolController>(
                    init: AddSchoolController(),
                    builder: (controller)=> TextField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                      readOnly: false,
                      controller: controller.phoneController,
                      obscureText:  false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.phone),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        focusColor: PrimaryColor,
                        labelText:  StringTranslateExtension('telephone').tr(),
                        labelStyle: TextStyle(
                            color: gray,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cairo",
                            fontSize: 14.sp
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.9.w,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: const BorderSide(
                              color: Gry3,
                              width: 1.9,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.9,
                            )
                        ),
                      ),
                    ),
                      //   PrimaryTextField(hintText: 'telephone'.tr()  ,controller: controller.phoneController,
                      // prefixIcon: const Icon(Icons.phone),
                      // visibility: false,centered: false,),
                  ),
                ],
              ),
            ),
            90.verticalSpace,
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 220.w,
        height: 55.h,
        child: GetBuilder<AddSchoolController>(
          init: AddSchoolController(),
          builder:(controller) =>FloatingActionButton.extended(
            backgroundColor: PrimaryColor,
            onPressed: () async {
              controller.addSchool();
            },
            label: Text(
              "addacc",
              style: TextStyle(fontSize: 16.sp, fontFamily: "cairo"),
            ).tr(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
