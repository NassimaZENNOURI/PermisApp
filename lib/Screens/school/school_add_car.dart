import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import '../../Components/appVars.dart';
import '../../controllers/school/school_add_car_controller.dart';

class SchoolAddCar extends StatelessWidget {
  const SchoolAddCar({Key? key}) : super(key: key);

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
            17.verticalSpace,
            Text(
              "addcar",
              style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ).tr(),
            17.verticalSpace,
            InkWell(
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
                          GetBuilder<SchoolAddCarController>(
                            init: SchoolAddCarController() ,
                            builder: (controller)=> InkWell(
                              onTap: () async {
                                Get.back(result: context);
                                controller.getImage(ImageSource.camera);
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
                          GetBuilder<SchoolAddCarController>(
                            builder: (controller)=> InkWell(
                              onTap: () async {
                                Get.back(result: context);
                                controller.getImage(ImageSource.gallery);
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
                                      )
                                  ).tr(),
                                ],
                              ),
                            ),
                          ),
                          9.verticalSpace,
                          GetBuilder<SchoolAddCarController>(
                            builder:(controller) => InkWell(
                              onTap: () {
                                controller.deleteImage();
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
              child: Container(
                height: 100.w,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                    border: Border.all(color: Gry3, width: 1.2.w)),
                child: GetBuilder<SchoolAddCarController>(
                  init: SchoolAddCarController(),
                  builder:(controller) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                    child: controller.selectedImagePath.value == '' ?
                    CachedNetworkImage(
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                          CircularProgressIndicator(
                              value: downloadProgress.progress),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      imageUrl:
                      '$car/photo.png',
                      width: 98.w,
                      height: 98.w,
                      fit: BoxFit.cover,
                    ) : Image.file(
                      File(controller.selectedImagePath.value),
                      width: 98.w,
                      height: 98.w,
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Text(
              "carpic",
              style: TextStyle(
                color: Dark,
                fontFamily: 'cairo',
                fontSize: 14.sp,
              ),
            ).tr(),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  GetBuilder<SchoolAddCarController>(
                    builder:(controller)=> TextField(
                        style: TextStyle(
                            color: gray,
                            fontFamily: 'cairo',
                            fontSize: 14.sp),
                        controller: controller.brandController,
                        decoration: InputDecoration(
                          hintText: StringTranslateExtension('brand').tr(),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 13.w),
                          suffixIcon: const Icon(
                            Icons.time_to_leave_outlined,
                            color: gray,
                          ),
                          focusColor: PrimaryColor,
                          labelStyle: TextStyle(
                              color: gray,
                              fontWeight: FontWeight.bold,
                              fontFamily: "cairo",
                              fontSize: 14.sp),
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.9.w,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: const BorderSide(
                                color: Gry3,
                                width: 1.9,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor,
                                width: 1.9,
                              )),
                        )
                    ),
                  ),
                  10.verticalSpace,
                  GetBuilder<SchoolAddCarController>(
                    builder:(controller)=> TextField(
                        style: TextStyle(
                            color: gray,
                            fontFamily: 'cairo',
                            fontSize: 14.sp),
                        controller: controller.versionController,
                        decoration: InputDecoration(
                          hintText: StringTranslateExtension('version').tr(),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 13.w),
                          suffixIcon: Icon(
                            Icons.notifications_none,
                            color: gray,
                          ),
                          focusColor: PrimaryColor,
                          labelStyle: TextStyle(
                              color: gray,
                              fontWeight: FontWeight.bold,
                              fontFamily: "cairo",
                              fontSize: 14.sp),
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.9.w,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: const BorderSide(
                                color: Gry3,
                                width: 1.9,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor,
                                width: 1.9,
                              )),
                        )),
                  ),
                  10.verticalSpace,
                  GetBuilder<SchoolAddCarController>(
                    builder:(controller)=>  SizedBox(
                      width: 339.w,
                      height: 55.h,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(12.r)),
                              border:
                              Border.all(color: Gry3, width: 1.9.w)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 13.w),
                                child: Icon(
                                  IconlyBroken.arrow_down_2,
                                  color: Dark,
                                  size: 26.sp,
                                ),
                              ),
                              hint: Padding(padding:EdgeInsets.only(left: 10.w) ,
                                child: const Text('Genre').tr(),
                              ),
                              value: controller.SelectedGender,
                              items: [
                                DropdownMenuItem(
                                  value: "Diesel",
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 13.w),
                                    child: Text(
                                      "Diesel",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                    value: "Electronique",
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 13.w),
                                      child: Text(
                                        "Electronique",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo',
                                            color: Colors.black),
                                      ),
                                    )),
                                DropdownMenuItem(
                                    value: "Essence",
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 13.w),
                                      child: Text(
                                        "Essence",
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo',
                                            color: Colors.black),
                                      ),
                                    )),
                              ],
                              onChanged: (value) => {
                                controller.SelectedGender ='$value',
                                controller.genreController.text ='$value',
                                controller.getDropDownItem(),
                              },
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'cairo',
                                  fontSize: 16),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                            ),
                          )),
                    ),
                  ),
                  10.verticalSpace,
                  GetBuilder<SchoolAddCarController>(
                    builder:(controller)=> TextField(
                        style: TextStyle(
                            color: gray,
                            fontFamily: 'cairo',
                            fontSize: 14.sp),
                        controller: controller.colorController,
                        decoration: InputDecoration(
                          hintText: StringTranslateExtension('color').tr(),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 13.w),
                          suffixIcon: const Icon(
                            Icons.color_lens_outlined,
                            color: gray,
                          ),
                          focusColor: PrimaryColor,
                          labelStyle: TextStyle(
                              color: gray,
                              fontWeight: FontWeight.bold,
                              fontFamily: "cairo",
                              fontSize: 14.sp),
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.9.w,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: const BorderSide(
                                color: Gry3,
                                width: 1.9,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor,
                                width: 1.9,
                              )),
                        )),
                  ),
                  10.verticalSpace,
                  GetBuilder<SchoolAddCarController>(
                    builder:(controller)=>  TextField(
                        style: TextStyle(
                            color: gray,
                            fontFamily: 'cairo',
                            fontSize: 14.sp),
                        controller: controller.matriculeController,
                        decoration: InputDecoration(
                          hintText: StringTranslateExtension('matricule').tr(),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 13.w),
                          suffixIcon: const Icon(
                            Icons.numbers,
                            color: gray,
                          ),
                          focusColor: PrimaryColor,
                          labelStyle: TextStyle(
                              color: gray,
                              fontWeight: FontWeight.bold,
                              fontFamily: "cairo",
                              fontSize: 14.sp),
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.9.w,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: const BorderSide(
                                color: Gry3,
                                width: 1.9,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor,
                                width: 1.9,
                              )),
                        )),
                  ),
                  10.verticalSpace,
                  GetBuilder<SchoolAddCarController>(
                    builder:(controller)=> TextField(
                        style: TextStyle(
                            color: gray,
                            fontFamily: 'cairo',
                            fontSize: 14.sp),
                        controller: controller.kilometrageController,
                        decoration: InputDecoration(
                          hintText: StringTranslateExtension('kilometrage').tr(),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20.h, horizontal: 13.w),
                          suffixIcon: const Icon(
                            Icons.route_sharp,
                            color: gray,
                          ),
                          focusColor: PrimaryColor,
                          labelStyle: TextStyle(
                              color: gray,
                              fontWeight: FontWeight.bold,
                              fontFamily: "cairo",
                              fontSize: 14.sp),
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1.9.w,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: const BorderSide(
                                color: Gry3,
                                width: 1.9,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(12.r)),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor,
                                width: 1.9,
                              )),
                        )),
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
        child: GetBuilder<SchoolAddCarController>(
          init: SchoolAddCarController(),
          builder:(controller)=>  FloatingActionButton.extended(
            backgroundColor: PrimaryColor,
            onPressed: () async {
              controller.schoolAddCar();
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


