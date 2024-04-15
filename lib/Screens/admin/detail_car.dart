//DetailsCars
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../Components/functions.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/admin_car_detail_controller.dart';
import '../../controllers/admin/car_list_controller.dart';
import 'admin_home_screen.dart';

class DetailCars extends StatelessWidget {
  const DetailCars({super.key});

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
                      GetBuilder<AdminCarDetailController>(
                        init: AdminCarDetailController(),
                        builder:(controller)=> ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(3456789.r)),
                            child: CachedNetworkImage(
                              width: 100.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                              imageUrl: '$car/${controller.car.photo}',
                              progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            )
                        ),
                      ),
                      10.verticalSpace,
                      GetBuilder<AdminCarDetailController>(
                        builder:(controller)=>  Text(
                            controller.car.brand.toString(),
                            style: TextStyle(
                              color: Dark,
                              fontFamily: 'cairo',
                              fontSize: 14.sp,
                            ),
                          ),
                       ),
                      GetBuilder<ListCarsController>(
                        init: ListCarsController(),
                        builder:(controller)=> Text(
                          controller.schoolnameController.text,
                          style: TextStyle(
                            color: gray,
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('schoolname', style: TextStyle(decoration: TextDecoration.underline,decorationColor: gray,color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<ListCarsController>(
                              builder:(controller)=> TextField(
                                  style: TextStyle(color: gray,fontFamily: 'cairo',fontSize: 14.sp),
                                  controller: controller.schoolnameController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                    suffixIcon: const Icon(
                                      Icons.home_work_outlined,
                                      color: gray,
                                    ),
                                    focusColor: PrimaryColor,
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
                            Row(
                              children: [
                                const Text('brand', style: TextStyle(decoration: TextDecoration.underline,decorationColor: gray,color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<AdminCarDetailController>(
                              builder:(controller)=>  TextField(
                                    style: TextStyle(color: gray,fontFamily: 'cairo',fontSize: 14.sp),
                                    decoration: InputDecoration(
                                      hintText: controller.car.brand,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
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
                            Row(
                              children: [
                                const Text('address', style: TextStyle(decoration: TextDecoration.underline,decorationColor: gray,color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<ListCarsController>(
                              builder:(controller)=> TextField(
                                  style: TextStyle(color: gray,fontFamily: 'cairo',fontSize: 14.sp),
                                  controller: controller.schoolAdressController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                    suffixIcon: const Icon(
                                      Icons.home_work_outlined,
                                      color: gray,
                                    ),
                                    focusColor: PrimaryColor,
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
                            Row(
                              children: [
                                const Text('color', style: TextStyle(decoration: TextDecoration.underline,decorationColor: gray,color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<AdminCarDetailController>(
                              builder:(controller)=>  TextField(
                                    style: TextStyle(color: gray,fontFamily: 'cairo',fontSize: 14.sp),
                                    decoration: InputDecoration(
                                      hintText: controller.car.color,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
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
                            Row(
                              children: [
                                const Text('createdat', style: TextStyle(decoration: TextDecoration.underline,decorationColor: gray,color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<AdminCarDetailController>(
                              builder:(controller)=>  TextField(
                                    style: TextStyle(color: gray,fontFamily: 'cairo',fontSize: 14.sp),
                                    decoration: InputDecoration(
                                      hintText: controller.car.createdAt!.split(':')[0],
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                      suffixIcon: const Icon(
                                        Icons.car_crash_outlined,
                                        color: gray,
                                      ),
                                      focusColor: PrimaryColor,
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
                            Row(
                              children: [
                                const Text('matricule', style: TextStyle(decoration: TextDecoration.underline,decorationColor: gray,color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<AdminCarDetailController>(
                              builder:(controller)=>  TextField(
                                    style: TextStyle(color: gray,fontFamily: 'cairo',fontSize: 14.sp),
                                    decoration: InputDecoration(
                                      hintText: controller.car.matricule,
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                      suffixIcon: const Icon(
                                        Icons.clear_all_rounded,
                                        color: gray,
                                      ),
                                      focusColor: PrimaryColor,
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
                            Row(
                              children: [
                                const Text('type', style: TextStyle(decoration: TextDecoration.underline,decorationColor: gray,color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<AdminCarDetailController>(
                              builder:(controller)=>  TextField(
                                  style: TextStyle(color: gray,fontFamily: 'cairo',fontSize: 14.sp),
                                  decoration: InputDecoration(
                                    hintText: controller.car.engine,
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                    suffixIcon: const Icon(
                                      Icons.time_to_leave,
                                      color: gray,
                                    ),
                                    focusColor: PrimaryColor,
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
                            Row(
                              children: [
                                const Text('status', style: TextStyle(decoration: TextDecoration.underline,decorationColor: gray,color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<AdminCarDetailController>(
                              builder:(controller)=>  TextField(
                                    style: TextStyle(color: gray,fontFamily: 'cairo',fontSize: 14.sp),
                                    decoration: InputDecoration(
                                      hintText: controller.car.status.toString() == "1" ? StringTranslateExtension('actif').tr() : StringTranslateExtension('inactif').tr(),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                      suffixIcon: const Icon(
                                        Icons.person_pin_outlined,
                                        color: gray,
                                      ),
                                      focusColor: PrimaryColor,
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
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      GetBuilder<AdminCarDetailController>(
                        builder:(controller)=>  ElevatedButton(
                          onPressed: () {
                            DeleteCarPopup(context, StringTranslateExtension('deleteaccount').tr(), controller.car.id!, AdminHomeScreen(),);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffD16868),
                          ),
                          child: const Text('delete', style: TextStyle(color: Colors.white),).tr(),
                        ),
                      ),
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
