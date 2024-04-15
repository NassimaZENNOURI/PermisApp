import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permisapp/components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/car_add_controller.dart';

class AddCar extends StatelessWidget {
  AddCar({Key? key}) : super(key: key);


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
      body: GetBuilder<AddCarsController>(
        init: AddCarsController(),
        builder:(controller)=> SingleChildScrollView(
          child: controller.isloading == true? const Loading() : Column(
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
                      title: Text('pickchange',
                          style: TextStyle(
                            color: PrimaryColor,
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          )).tr(),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            GetBuilder<AddCarsController>(
                              init:AddCarsController(),
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
                                    Text('takepicker',
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
                            GetBuilder<AddCarsController>(
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
                            GetBuilder<AddCarsController>(
                              builder:(controller)=> InkWell(
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
                },
                child: Container(
                  height: 100.w,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      border: Border.all(color: Gry3, width: 1.2.w)),
                  child: GetBuilder<AddCarsController>(
                    init: AddCarsController(),
                    builder:(controller)=> ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      child: controller.selectedImagePath.value == '' ?
                      CachedNetworkImage(
                        imageUrl:'$car/photo.png',
                        width: 98.w,
                        height: 98.w,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ):
                      Image.file(
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
                    GetBuilder<AddCarsController>(
                      builder:(controller)=> TextField(
                          style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                          readOnly: false,
                          controller: controller.brandController,
                          obscureText:  false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                            focusColor: PrimaryColor,
                            labelText:  StringTranslateExtension('brand').tr(),
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
                    ),
                    10.verticalSpace,
                    GetBuilder<AddCarsController>(
                      builder:(controller)=> TextField(
                        style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                        readOnly: false,
                        controller: controller.versionController,
                        obscureText:  false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                          focusColor: PrimaryColor,
                          labelText:  StringTranslateExtension('version').tr(),
                          labelStyle: TextStyle(
                              color: gray,
                              fontWeight: FontWeight.bold,
                              fontFamily: "cairo",
                              fontSize: 14.sp),
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
                        )
                      ),
                    ),
                    10.verticalSpace,
                    SizedBox(
                      width: 339.w,
                      height: 55.h,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(12.r)),
                              border: Border.all(color: Gry3, width: 1.9.w)),
                          child: GetBuilder<AddCarsController>(
                              builder:(controller)=> DropdownButtonHideUnderline(
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
                          )
                      ),),
                    ),
                    10.verticalSpace,
                    GetBuilder<AddCarsController>(
                      builder:(controller)=> SizedBox(
                        width: 339.w,
                        height: 55.h,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                                border: Border.all(color: Gry3, width: 1.9.w)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  child: Icon(
                                    IconlyBroken.arrow_down_2,
                                    color: Dark,
                                    size: 26.sp,
                                  ),
                                ),
                                hint: Padding(padding:EdgeInsets.only(left: 10.w) ,
                                  child: Text('schoolname', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 13,color: Colors.grey.shade500),).tr(),
                                ),
                                //controller.schools[0].id.toString()
                                value: controller.SelectedSchool,
                                items: controller.schools.map((value){
                                  return DropdownMenuItem(
                                  value: value.id.toString(),
                                  child: Padding(padding:EdgeInsets.only(left: 10.w),
                                      child: Text(value.name!, style: TextStyle(fontSize: 14.sp ,fontWeight: FontWeight.bold),)
                                  ),);
                                }).toList(),

                                onChanged: (value) => {
                                  controller.SelectedSchool = '$value' ,
                                  controller.schoolController.text = '$value',
                                  controller.changeDropDownItem(),
                                },
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'cairo',
                                    fontSize: 16),
                                dropdownColor: Colors.white,
                                isExpanded: true,
                              ),
                            )
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    GetBuilder<AddCarsController>(
                      builder:(controller)=> TextField(
                          style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                          readOnly: false,
                          controller: controller.colorController,
                          obscureText:  false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                            focusColor: PrimaryColor,
                            labelText:  StringTranslateExtension('color').tr(),
                            labelStyle: TextStyle(
                                color: gray,
                                fontWeight: FontWeight.bold,
                                fontFamily: "cairo",
                                fontSize: 14.sp),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.9.w,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                borderSide: const BorderSide(
                                  color: Gry3,
                                  width: 1.9,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.9,
                                )),
                          )),
                    ),
                    10.verticalSpace,
                    GetBuilder<AddCarsController>(
                      builder:(controller)=> TextField(
                          style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                          readOnly: false,
                          controller: controller.matriculeController,
                          obscureText:  false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                            focusColor: PrimaryColor,
                            labelText:  StringTranslateExtension('matricule').tr(),
                            labelStyle: TextStyle(
                                color: gray,
                                fontWeight: FontWeight.bold,
                                fontFamily: "cairo",
                                fontSize: 14.sp),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.9.w,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                borderSide: const BorderSide(
                                  color: Gry3,
                                  width: 1.9,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.9,
                                )),
                          )),
                    ),
                    10.verticalSpace,
                    GetBuilder<AddCarsController>(
                      builder:(controller)=> TextField(
                          style: TextStyle(color:   gray,fontFamily: 'cairo',fontSize: 14.sp),
                          readOnly: false,
                          controller: controller.kilometrageController,
                          obscureText:  false,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                            focusColor: PrimaryColor,
                            labelText: StringTranslateExtension('kilometrage').tr(),
                            labelStyle: TextStyle(
                                color: gray,
                                fontWeight: FontWeight.bold,
                                fontFamily: "cairo",
                                fontSize: 14.sp),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.9.w,
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                borderSide: const BorderSide(
                                  color: Gry3,
                                  width: 1.9,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.r)),
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
      floatingActionButton: SizedBox(
        width: 220.w,
        height: 55.h,
        child: GetBuilder<AddCarsController>(
          builder:(controller)=> FloatingActionButton.extended(
            backgroundColor: PrimaryColor,
            onPressed: () async {
              controller.addCar();
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
