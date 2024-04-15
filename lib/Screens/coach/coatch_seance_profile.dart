import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/coatch/coach_seance_profile_controller.dart';
import 'coach_candidat_detail.dart';

class CoatchSeanceProfile extends StatelessWidget {
  const CoatchSeanceProfile({super.key});

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
                  height: 46.h,
                  'assets/images/logo.png',
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        backgroundColor: PrimaryColor,
        toolbarHeight: 80.h,
        elevation: 0,
      ),
      body: GetBuilder<CoachSeanceProfileController>(
        init: CoachSeanceProfileController(),
        builder:(controller)=> controller.isLoading.value ? const Loading() : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: Column(
                  children: [
                17.verticalSpace,
                17.verticalSpace,
                Text(
                  "seance",
                  style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ).tr(),
                20.verticalSpace,
                Row(
                  children: [
                    const Text('schoolname', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                    const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                  ],
                ),
                GetBuilder<CoachSeanceProfileController>(
                  init: CoachSeanceProfileController(),
                  builder:(controller)=> TextField(
                      readOnly: true,
                      style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: controller.seance.schoolName.toString(),
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        suffixIcon: const Icon(
                          Icons.school,
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
                10.verticalSpace,
                Row(
                  children: [
                    const Text('coachname', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                    const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                  ],
                ),
                GetBuilder<CoachSeanceProfileController>(
                  builder:(controller)=> TextField(
                      readOnly: true,
                      style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: controller.seance.moniteurName.toString(),
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
                10.verticalSpace,
                Row(
                  children: [
                    const Text('timeseance', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                    const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                  ],
                ),
                GetBuilder<CoachSeanceProfileController>(
                  builder:(controller)=> TextField(
                      readOnly: true,
                      style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: controller.seance.time.toString(),
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        suffixIcon: const Icon(
                          Icons.timer,
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
                10.verticalSpace,
                Row(
                  children: [
                    const Text('startdate', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                    const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                  ],
                ),
                GetBuilder<CoachSeanceProfileController>(
                  builder:(controller)=> TextField(
                      readOnly: true,
                      style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: controller.seance.dateStart.toString(),
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        suffixIcon: const Icon(
                          Icons.start_sharp,
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
                10.verticalSpace,
                Row(
                  children: [
                    const Text('car', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                    const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                  ],
                ),
                GetBuilder<CoachSeanceProfileController>(
                  builder:(controller)=> TextField(
                      readOnly: true,
                      style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: '${controller.seance.car_brand ?? " "} (${controller.seance.car_color ?? " "})',
                        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
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
                      )),
                ),
                15.verticalSpace,
                GetBuilder<CoachSeanceProfileController>(
                  init: CoachSeanceProfileController(),
                  builder:(controller)=>  Container(
                    height: 250.h,
                    width: 330.w,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      itemCount: controller.candidats!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final candidat = controller.candidats[index] ;
                        return InkWell(
                            onTap: (){
                              Get.to(
                                  CoachDetailCandidat() , arguments: [candidat]
                              );
                            },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset:const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 50.h,
                                        width: 50.w,
                                        child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(90.r)),
                                            child:CachedNetworkImage(
                                                   imageUrl: '$canpict/${candidat.photo}',
                                              fit: BoxFit.cover,
                                              height: 60.h,
                                              width: 60.h,
                                              progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                              ),
                                            )
                                    ),
                                    10.verticalSpace,
                                    Text("${candidat.name!.split(' ')[0]} ..."),
                                  ],
                                ),
                              )
                            );
                      },
                    ),
                  ),
                )
              ]),
            )),
      ),
    );
  }
}
