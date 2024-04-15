import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permisapp/components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/school/school_add_coach2_controller.dart';

class SchoolAddCoatch2 extends StatelessWidget {
  const SchoolAddCoatch2({Key? key}) : super(key: key);

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
            !isar ? IconlyBroken.arrow_left_2 : IconlyBroken.arrow_right_2,
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
      body: GetBuilder<SchoolAddCoach2Controller>(
        init: SchoolAddCoach2Controller(),
        builder:(controller)=> controller.isloading.value ? const Loading(): Padding(
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
                        color: Gry3,
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
                    "addcoatch",
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
                    "front",
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
                          title:Text('picchange',
                              style: TextStyle(
                                color: PrimaryColor,
                                fontFamily: 'cairo',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              )).tr(),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                GetBuilder<SchoolAddCoach2Controller>(
                                  init : SchoolAddCoach2Controller(),
                                  builder:(controller)=> InkWell(
                                    onTap: () async {
                                      Get.back(result: context);
                                      controller.getImage1(ImageSource.camera);
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
                                            )).tr(),
                                      ],
                                    ),
                                  ),
                                ),
                                9.verticalSpace,
                                GetBuilder<SchoolAddCoach2Controller>(
                                  builder:(controller)=> InkWell(
                                    onTap: () async {
                                      Get.back(result: context);
                                      controller.getImage1(ImageSource.gallery);
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
                                GetBuilder<SchoolAddCoach2Controller>(
                                  builder:(controller)=> InkWell(
                                    onTap: () {
                                      controller.deleteImage1();
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

                      // });
                    },
                    child: GetBuilder<SchoolAddCoach2Controller>(
                      init: SchoolAddCoach2Controller(),
                      builder:(controller)=> Container(
                        width: 335,
                        height: 199.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          border: Border.all(color: Gry3),
                        ),
                        child: controller.selectedImagePath1.path == '' ?
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
                          File(controller.selectedImagePath1.path),
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
                    "back",
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 14.sp,
                    ),
                  ).tr(),
                ),
                10.verticalSpace,
                InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0.r),
                        ),
                        title: Text('picchange',
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                              color: PrimaryColor,
                              fontFamily: 'cairo',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            )).tr(),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              GetBuilder<SchoolAddCoach2Controller>(
                                builder:(controller)=> InkWell(
                                  onTap: () async {
                                    Get.back(result: context);
                                    controller.getImage2(ImageSource.camera);
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
                                          )).tr(),
                                    ],
                                  ),
                                ),
                              ),
                              9.verticalSpace,
                              GetBuilder<SchoolAddCoach2Controller>(
                                builder:(controller)=> InkWell(
                                  onTap: () async {
                                    Get.back(result: context);
                                    controller.getImage2(ImageSource.gallery);
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
                              GetBuilder<SchoolAddCoach2Controller>(
                                builder:(controller)=> InkWell(
                                  onTap: () {
                                    controller.deleteImage2();
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

                    // });
                  },
                  child: Center(
                    child: GetBuilder<SchoolAddCoach2Controller>(
                      init: SchoolAddCoach2Controller(),
                      builder:(controller)=> Container(
                          width: 335,
                          height: 199.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.r)),
                            border: Border.all(color: Gry3),
                          ),
                          child: controller.selectedImagePath2.path == '' ?
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
                            File(controller.selectedImagePath2.path),
                            width: 98.w,
                            height: 98.w,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                ),
                90.verticalSpace,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 220.w,
        height: 55.h,
        child: GetBuilder<SchoolAddCoach2Controller>(
          init: SchoolAddCoach2Controller(),
          builder:(controller)=> FloatingActionButton.extended(
            backgroundColor: PrimaryColor,
            onPressed: () async {
              controller.schoolAddCoatch2(context);
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
