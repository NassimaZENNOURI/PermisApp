import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permisapp/controllers/school/school_add_candidat3_controller.dart';
import '../../Components/appVars.dart';

class SchoolAddCandidat3 extends StatelessWidget {
  const SchoolAddCandidat3({Key? key}) : super(key: key);

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
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                17.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: .4.h),
                        child: Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'cairo'),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 4.h,
                      width: 119.w,
                      color: PrimaryColor,
                    ),
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: .4.h),
                        child: Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'cairo'),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 4.h,
                      width: 119.w,
                      color: PrimaryColor,
                    ),
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.4.h),
                        child: Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'cairo'),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                17.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Text(
                    "addcandidat",
                    style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ).tr(),
                ),
                5.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Text(
                    "contrat",
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ).tr(),
                ),
                10.verticalSpace,
                Center(
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0.r),
                          ),
                          title: Text('picchange',
                              style: TextStyle(
                                color: PrimaryColor,
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              )
                          ).tr(),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                GetBuilder<SchoolAddCandidat3Controller>(
                                  init:SchoolAddCandidat3Controller(),
                                  builder:(controller)=> InkWell(
                                    onTap: () async {
                                      Get.back(result: context);
                                      controller.getImage3(ImageSource.camera);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconlyBroken.camera,
                                          color: PrimaryColor,
                                          size: 26.h,
                                        ),
                                        14.horizontalSpace,
                                        Text('takepic',
                                            style: TextStyle(
                                              color: Dark,
                                              fontFamily: 'cairo',
                                              fontSize: 14.sp,
                                            )
                                        ).tr(),
                                      ],
                                    ),
                                  ),
                                ),
                                9.verticalSpace,
                                GetBuilder<SchoolAddCandidat3Controller>(
                                  builder:(controller)=> InkWell(
                                    onTap: () async {
                                      Get.back(result: context);
                                      controller.getImage3(ImageSource.gallery);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconlyBroken.image,
                                          color: PrimaryColor,
                                          size: 26.h,
                                        ),
                                        14.horizontalSpace,
                                        Text('choosepic',
                                            style: TextStyle(
                                              color: Dark,
                                              fontFamily: 'cairo',
                                              fontSize: 14.sp,
                                            )).tr(),
                                      ],
                                    ),
                                  ),
                                ),
                                9.verticalSpace,
                                GetBuilder<SchoolAddCandidat3Controller>(
                                  builder:(controller)=>  InkWell(
                                    onTap: () {
                                      controller.deleteImage3();
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconlyBroken.delete,
                                          color: const Color(0xffD16868),
                                          size: 26.h,
                                        ),
                                        14.horizontalSpace,
                                        Text('removepic',
                                            style: TextStyle(
                                              color: const Color(0xffD16868),
                                              fontFamily: 'cairo',
                                              fontSize: 14.sp,
                                            )
                                        ).tr(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child:GetBuilder<SchoolAddCandidat3Controller>(
                      init:SchoolAddCandidat3Controller(),
                      builder:(controller)=> Container(
                          width: 335,
                          height: 199.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.r)),
                            border: Border.all(color: Gry3),
                          ),
                          child: controller.selectedImagePath3.path == ''?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                IconlyBroken.camera,
                                size: 40.sp,
                                color: Gry3,
                              ),
                              18.verticalSpace,
                             Text(
                                'camera',
                                style: TextStyle(
                                  color: Gry3,
                                  fontFamily: 'cairo',
                                  fontSize: 14.sp,
                                ),
                              ).tr(),
                            ],
                          )
                              : Image.file(
                            File(controller.selectedImagePath3.path),
                            width: 98.w,
                            height: 98.w,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child:Text(
                    "doctor",
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ).tr(),
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0.r),
                          ),
                          title: Text('picchange',
                              style: TextStyle(
                                color: PrimaryColor,
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              )).tr(),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                GetBuilder<SchoolAddCandidat3Controller>(
                                  init:SchoolAddCandidat3Controller(),
                                  builder:(controller)=> InkWell(
                                    onTap: () async {
                                      Get.back(result: context);
                                      controller.getImage4(ImageSource.camera);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconlyBroken.camera,
                                          color: PrimaryColor,
                                          size: 26.h,
                                        ),
                                        14.horizontalSpace,
                                        Text('takepic',
                                            style: TextStyle(
                                              color: Dark,
                                              fontFamily: 'cairo',
                                              fontSize: 14.sp,
                                            )
                                        ).tr(),
                                      ],
                                    ),
                                  ),
                                ),
                                9.verticalSpace,
                                GetBuilder<SchoolAddCandidat3Controller>(
                                  builder:(controller)=>  InkWell(
                                    onTap: () async {
                                      Get.back(result: context);
                                      controller.getImage4(ImageSource.gallery);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconlyBroken.image,
                                          color: PrimaryColor,
                                          size: 26.h,
                                        ),
                                        14.horizontalSpace,
                                        Text('choosepic',
                                            style: TextStyle(
                                              color: Dark,
                                              fontFamily: 'cairo',
                                              fontSize: 14.sp,
                                            )).tr(),
                                      ],
                                    ),
                                  ),
                                ),
                                9.verticalSpace,
                                GetBuilder<SchoolAddCandidat3Controller>(
                                  builder:(controller)=> InkWell(
                                    onTap: () {
                                      controller.deleteImage4();
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconlyBroken.delete,
                                          color: const Color(0xffD16868),
                                          size: 26.h,
                                        ),
                                        14.horizontalSpace,
                                        Text('removepic',
                                            style: TextStyle(
                                              color: const Color(0xffD16868),
                                              fontFamily: 'cairo',
                                              fontSize: 14.sp,
                                            )).tr(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: GetBuilder<SchoolAddCandidat3Controller>(
                      init:SchoolAddCandidat3Controller(),
                      builder:(controller)=>  Container(
                          width: 335,
                          height: 199.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.r)),
                            border: Border.all(color: Gry3),
                          ),
                          child: controller.selectedImagePath4.path ==''?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                IconlyBroken.camera,
                                size: 40.sp,
                                color: Gry3,
                              ),
                              18.verticalSpace,
                              Text(
                                'camera',
                                style: TextStyle(
                                  color: Gry3,
                                  fontFamily: 'cairo',
                                  fontSize: 14.sp,
                                ),
                              ).tr(),
                            ],
                          )
                              : Image.file(
                            File(controller.selectedImagePath4.path),
                            width: 98.w,
                            height: 98.w,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Text(
                    "tarifs",
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ).tr(),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33.0.w),
                  child: GetBuilder<SchoolAddCandidat3Controller>(
                    init:SchoolAddCandidat3Controller(),
                    builder:(controller)=> TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: gray, fontFamily: 'cairo', fontSize: 14.sp),
                        readOnly: false,
                        controller: controller.tarifsController,
                        obscureText: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 13.w),
                          focusColor: PrimaryColor,
                          labelText: StringTranslateExtension('tarifs').tr(),
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
                        )),
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Text(
                    "paid",
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ).tr(),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 33.0.w),
                  child: GetBuilder<SchoolAddCandidat3Controller>(
                    builder:(controller)=>  TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            color: gray, fontFamily: 'cairo', fontSize: 14.sp),
                        readOnly: false,
                        controller: controller.paidController,
                        obscureText: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 13.w),
                          focusColor: PrimaryColor,
                          labelText: StringTranslateExtension('paid').tr(),
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
                        )),
                  ),
                ),
                90.verticalSpace,
              ],
            ),
          ),
        ),

      floatingActionButton: SizedBox(
        width: 220.w,
        height: 55.h,
        child: GetBuilder<SchoolAddCandidat3Controller>(
          init:SchoolAddCandidat3Controller(),
          builder:(controller)=> FloatingActionButton.extended(
            backgroundColor: PrimaryColor,
            onPressed: () async {
              controller.schoolAddCandidat3(context);
            },
            label: Text(
              "continue",
              style: TextStyle(fontSize: 16.sp, fontFamily: "cairo"),
            ).tr(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}
