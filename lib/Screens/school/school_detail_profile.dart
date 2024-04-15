import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../components/appVars.dart';
import '../../controllers/school/school_detail_profile_controller.dart';
import '../coach/coatch_notification_page.dart';

class SchoolDetailsProfile extends StatelessWidget {
  const SchoolDetailsProfile({super.key});

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
        child: Column(
          children: [
            21.verticalSpace,
            Center(
              child: Column(
                children: [
                  GetBuilder<SchoolDetailProfileController>(
                    init: SchoolDetailProfileController(),
                    builder:(controller)=> ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(3456789.r)),
                        child:  CachedNetworkImage(
                            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            imageUrl: '$pict/${controller.school.logo}',
                            width: 100.w,
                            height: 100.w,
                            fit: BoxFit.cover,
                          ),

                    ),
                  ),
                  10.verticalSpace,
                  GetBuilder<SchoolDetailProfileController>(
                    builder:(controller)=> Text(
                        controller.school.name.toString(),
                        style: TextStyle(
                          color: Dark,
                          fontFamily: 'cairo',
                          fontSize: 14.sp,
                        ),
                      ),
                  ),

                  GetBuilder<SchoolDetailProfileController>(
                    builder:(controller)=> Text(
                      controller.school.school_name!,
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
                        Text('fullname',style: TextStyle(fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),).tr(),
                        GetBuilder<SchoolDetailProfileController>(
                          builder:(controller)=>TextField(
                            readOnly: true,
                              style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: controller.school.name.toString(),
                                contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                suffixIcon: const Icon(
                                  Icons.person,
                                  color: gray,
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              )),
                        ),
                        20.verticalSpace,
                        Text('telephone',style: TextStyle(fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),).tr(),
                        GetBuilder<SchoolDetailProfileController>(
                          builder:(controller)=> TextField(
                              readOnly: true,
                              style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: controller.school.phoneNo.toString(),
                                contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                suffixIcon: const Icon(
                                  Icons.phone,
                                  color: gray,
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              )),
                        ),
                        20.verticalSpace,
                        Text('schooladdress',style: TextStyle(fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),).tr(),
                        GetBuilder<SchoolDetailProfileController>(
                          builder:(controller)=> TextField(
                              readOnly: true,
                              style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: controller.school.address.toString(),
                                contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                suffixIcon: const Icon(
                                  Icons.location_city,
                                  color: gray,
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              )),
                        ),
                        20.verticalSpace,
                        Text('city',style: TextStyle(fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),).tr(),
                        GetBuilder<SchoolDetailProfileController>(
                          builder:(controller)=>TextField(
                              readOnly: true,
                              style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: controller.school.city.toString(),
                                contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                suffixIcon: const Icon(
                                  Icons.location_city_sharp,
                                  color: gray,
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              )),
                        ),
                        20.verticalSpace,
                        Text('createdat',style: TextStyle(fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),).tr(),
                        GetBuilder<SchoolDetailProfileController>(
                          builder:(controller)=> TextField(
                              readOnly: true,
                              style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: controller.school.createdAt.toString().split(':')[0],
                                contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                suffixIcon: const Icon(
                                  Icons.date_range_sharp,
                                  color: gray,
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              )),
                        ),
                        20.verticalSpace,
                        Text('statusschool',style: TextStyle(fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),).tr(),
                        GetBuilder<SchoolDetailProfileController>(
                          builder:(controller)=>TextField(
                              readOnly: true,
                              style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: controller.school.status == '1' ? 'actif' : 'inactif',
                                contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                suffixIcon: const Icon(
                                  Icons.perm_identity,
                                  color: gray,
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              )),
                        ),
                        20.verticalSpace,
                        Text('description',style: TextStyle(fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),).tr(),
                        GetBuilder<SchoolDetailProfileController>(
                          builder:(controller)=>TextField(
                              readOnly: true,
                              style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: controller.school.description.toString(),
                                contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                suffixIcon: const Icon(
                                  Icons.description,
                                  color: gray,
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                              )),
                        ),
                      ],
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
