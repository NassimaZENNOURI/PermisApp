import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../Components/appVars.dart';
import '../../Components/functions.dart';
import '../../controllers/admin/admin_school_detail_controller.dart';
import 'admin_home_screen.dart';

class DetailSchool extends StatelessWidget {
  const DetailSchool({super.key});

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
            21.verticalSpace,
            Center(
              child: Column(
                children: [
                  GetBuilder<AdminSchoolDetailController>(
                    init: AdminSchoolDetailController(),
                    builder:(controller)=> ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(3456789.r)),
                        child: Image.network(
                          '$pict/${controller.school.logo}',
                          width: 100.w,
                          height: 100.w,
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  10.verticalSpace,
                  GetBuilder<AdminSchoolDetailController>(
                    builder:(controller)=> Text(
                      controller.school.name.toString(),
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Text(
                    "school1",
                    style: TextStyle(
                      color: gray,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ).tr(),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TextFormField(
                        //   enabled: false,
                        //   readOnly: true,
                        //   //controller: description,
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     contentPadding: EdgeInsets.symmetric(
                        //         vertical: 0.h, horizontal: 13.w),
                        //     focusColor: PrimaryColor,
                        //     labelText: school.email ?? 'pas1'.tr(),
                        //     labelStyle: TextStyle(
                        //         color: gray,
                        //         fontWeight: FontWeight.bold,
                        //         fontFamily: "cairo",
                        //         fontSize: 14.sp),
                        //     floatingLabelBehavior: FloatingLabelBehavior.never,
                        //     border: OutlineInputBorder(
                        //         borderRadius:
                        //         BorderRadius.all(Radius.circular(12.r)),
                        //         borderSide: BorderSide(
                        //           color: Colors.white,
                        //           width: 1.9.w,
                        //         )),
                        //     enabledBorder: OutlineInputBorder(
                        //         borderRadius:
                        //         BorderRadius.all(Radius.circular(12.r)),
                        //         borderSide: const BorderSide(
                        //           color: Gry3,
                        //           width: 1.9,
                        //         )),
                        //     focusedBorder: OutlineInputBorder(
                        //         borderRadius:
                        //         BorderRadius.all(Radius.circular(12.r)),
                        //         borderSide: BorderSide(
                        //           color: Theme.of(context).primaryColor,
                        //           width: 1.9,
                        //         )),
                        //   ),
                        //   minLines: 4,
                        //   keyboardType: TextInputType.multiline,
                        //   maxLines: null,
                        // ),
                        10.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Text('telephone',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Dark),).tr(),
                        ),
                        5.verticalSpace,
                        GetBuilder<AdminSchoolDetailController>(
                          builder:(controller)=>  TextFormField(
                            enabled: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: controller.school.phoneNo,
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.9.w,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: const BorderSide(
                                    color: Gry3,
                                    width: 1.9,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.9,
                                  )),
                            ),
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Text('city',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Dark),).tr(),
                        ),
                        5.verticalSpace,
                        GetBuilder<AdminSchoolDetailController>(
                          builder:(controller)=> TextFormField(
                            enabled: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: controller.school.city,
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.9.w,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: const BorderSide(
                                    color: Gry3,
                                    width: 1.9,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.9,
                                  )),
                            ),
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Text('address',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Dark),).tr(),
                        ),
                        5.verticalSpace,
                        GetBuilder<AdminSchoolDetailController>(
                          builder:(controller)=> TextFormField(
                            enabled: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: controller.school.address,
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.9.w,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: const BorderSide(
                                    color: Gry3,
                                    width: 1.9,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.9,
                                  )),
                            ),
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Text('date',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Dark),).tr(),
                        ),
                        5.verticalSpace,
                        GetBuilder<AdminSchoolDetailController>(
                          builder:(controller)=> TextFormField(
                            enabled: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: controller.school.createdAt!.split(':')[0],
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.9.w,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: const BorderSide(
                                    color: Gry3,
                                    width: 1.9,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.9,
                                  )),
                            ),
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Text('status',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Dark),).tr(),
                        ),
                        5.verticalSpace,
                        GetBuilder<AdminSchoolDetailController>(
                          builder:(controller)=>  TextFormField(
                            enabled: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric( horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: controller.school.status == "1" ? StringTranslateExtension('actif').tr() : StringTranslateExtension('inactif').tr(),
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.9.w,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: const BorderSide(
                                    color: Gry3,
                                    width: 1.9,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.9,
                                  )),
                            ),
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        15.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: const Text('description',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Dark),).tr(),
                        ),
                        5.verticalSpace,
                        GetBuilder<AdminSchoolDetailController>(
                          builder:(controller)=>  TextFormField(
                            enabled: false,
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: controller.school.description,
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.9.w,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: const BorderSide(
                                    color: Gry3,
                                    width: 1.9,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.9,
                                  )),
                            ),
                            minLines: 2,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        12.verticalSpace,

                      ],
                    ),
                  ),
                  15.verticalSpace,
                  Center(
                    child: GetBuilder<AdminSchoolDetailController>(
                      builder:(controller)=>  ElevatedButton(
                        onPressed:  () {
                          DeletePopup(context,StringTranslateExtension('deleteaccount').tr(), controller.school.id! , 'school', AdminHomeScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffD16868),
                        ),
                        child: const Text('delete',style: TextStyle(color: Colors.white),).tr(),
                      ),
                    ),
                  )
                ],
              ),
            ),
            90.verticalSpace,
          ],
        ),
      ),
    );
  }
}
