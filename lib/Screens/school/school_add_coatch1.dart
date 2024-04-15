import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/school/school_add_coach1_controller.dart';

class SchoolAddCoatch1 extends StatelessWidget {
  const SchoolAddCoatch1({Key? key}) : super(key: key);

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
      body: GetBuilder<SchoolAddCoach1Controller>(
        init: SchoolAddCoach1Controller(),
        builder:(controller) => controller.isloading.value ? const Loading() : Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
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
                        color: Gry3,
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
                      color: Gry3,
                    ),
                    Container(
                      width: 30.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: Gry3,
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: .4.h),
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
                Text(
                  "addcoach",
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
                            )).tr(),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              GetBuilder<SchoolAddCoach1Controller>(
                                init : SchoolAddCoach1Controller() ,
                                builder:(controller)=> InkWell(
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
                                          )).tr(),
                                    ],
                                  ),
                                ),
                              ),
                              9.verticalSpace,
                              GetBuilder<SchoolAddCoach1Controller>(
                                builder:(controller)=> InkWell(
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
                                          )).tr(),
                                    ],
                                  ),
                                ),
                              ),
                              9.verticalSpace,
                              GetBuilder<SchoolAddCoach1Controller>(
                                builder:(controller)=> InkWell(
                                  onTap: () {
                                    controller.deleteImage();
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
                  child: Container(
                    height: 100.w,
                    width: 100.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                        border: Border.all(color: Gry3, width: 1.2.w)),
                    child: GetBuilder<SchoolAddCoach1Controller>(
                      init: SchoolAddCoach1Controller(),
                      builder:(controller)=> ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                        child: controller.selectedImagePath.path == '' ?
                        CachedNetworkImage(
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                          imageUrl: '$mopict/photo.png',
                          width: 98.w,
                          height: 98.w,
                          fit: BoxFit.cover,
                        )
                            : Image.file(
                          File(controller.selectedImagePath.path),
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
                  "coachpic",
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
                      GetBuilder<SchoolAddCoach1Controller>(
                        builder:(controller)=> TextField(
                            style: TextStyle(
                                color: gray,
                                fontFamily: 'cairo',
                                fontSize: 14.sp),
                            readOnly: false,
                            controller: controller.nameController,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: StringTranslateExtension('fullname').tr(),
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
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
                      10.verticalSpace,
                      GetBuilder<SchoolAddCoach1Controller>(
                        builder:(controller)=> TextField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                color: gray,
                                fontFamily: 'cairo',
                                fontSize: 14.sp),
                            readOnly: false,
                            controller: controller.emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: StringTranslateExtension('email').tr(),
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
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
                            )
                        ),
                      ),
                      10.verticalSpace,
                      GetBuilder<SchoolAddCoach1Controller>(
                        builder:(controller) => TextFormField(
                          controller: controller.dateController,
                          decoration: InputDecoration(
                            filled: true,
                            hintText:StringTranslateExtension('date').tr(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13.w, vertical: 20),
                            hintStyle: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                                color: Dark),
                            suffixIcon:
                            const Icon(IconlyBroken.calendar, color: Dark),
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0.r),
                              borderSide: const BorderSide(
                                color: Gry3,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0.r),
                              borderSide: const BorderSide(
                                color: Gry3,
                                width: 1.9,
                              ),
                            ),
                          ),
                          onTap: () async {
                            DateTime? date = DateTime(1900);
                            FocusScope.of(context).requestFocus(FocusNode());

                            date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100));
                            var formate2 = "${date?.day}-${date?.month}-${date?.year}";
                            controller.dateController.text = formate2;
                          },
                        ),
                      ),
                      10.verticalSpace,
                      GetBuilder<SchoolAddCoach1Controller>(
                        builder:(controller) => SizedBox(
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
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 13.w),
                                    child: Icon(
                                      IconlyBroken.arrow_down_2,
                                      color: Dark,
                                      size: 26.sp,
                                    ),
                                  ),
                                  hint: const Text('Genre'),
                                  value: controller.SelectedGender,
                                  items: [
                                    DropdownMenuItem(
                                      value: "Homme",
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.w),
                                        child: Text(
                                          "Homme",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo',
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                        value: "Femme",
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.w),
                                          child: Text(
                                            "Femme",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'cairo',
                                                color: Colors.black),
                                          ),
                                        )),
                                  ],
                                  onChanged: (value) {
                                    controller.SelectedGender = '$value' ;
                                    controller.genreController.text = '$value';
                                    controller.getDropDownItem() ;
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
                      GetBuilder<SchoolAddCoach1Controller>(
                        builder:(controller) => TextField(
                            style: TextStyle(
                                color: gray,
                                fontFamily: 'cairo',
                                fontSize: 14.sp),
                            readOnly: false,
                            controller: controller.cinController,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: StringTranslateExtension('cin').tr(),
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
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
                      10.verticalSpace,
                      GetBuilder<SchoolAddCoach1Controller>(
                        builder:(controller)=> TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: gray,
                                fontFamily: 'cairo',
                                fontSize: 14.sp),
                            readOnly: false,
                            controller: controller.phoneController,
                            obscureText: false,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: StringTranslateExtension('telephone').tr(),
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
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
                    ],
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
          child: GetBuilder<SchoolAddCoach1Controller>(
            init: SchoolAddCoach1Controller(),
            builder:(controller) => FloatingActionButton.extended(
              backgroundColor: PrimaryColor,
              onPressed: () async {
                controller.schoolAddCoatch1();
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