import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/coach/coatch_candidat_list.dart';
import 'package:permisapp/controllers/coatch/coatch_home_controller.dart';
import '../../Components/appVars.dart';
import 'coatch_seance_profile.dart';

class CoatchHome extends StatelessWidget {
  const CoatchHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GetBuilder<CoatchHomeController>(
        init: CoatchHomeController(),
        builder:(controller)=> SingleChildScrollView(
            child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(20.0.w, 20.w, 20.h, 0),
                      child: Row(
                        children: [
                          GetBuilder<CoatchHomeController>(
                            builder: (controller) => Text(
                              controller.coach.name.toString(),
                              style: TextStyle(
                                  color: Dark,
                                  fontFamily: 'cairo',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          5.horizontalSpace,
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Dark,
                            ),
                          ).tr(),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StatefulBuilder(
                            builder: (context , state ) {
                              return GetBuilder<CoatchHomeController>(
                                  builder:(controller) => Text(
                                    "${controller.timeOfDay.hour}:${controller.timeOfDay.minute < 10 ? '0${controller.timeOfDay.minute}' : controller.timeOfDay.minute}" ,
                                    style: TextStyle(
                                        fontSize: 67.sp,
                                        fontFamily: 'cairo',
                                        color: Dark
                                    ),
                                  )
                              );
                            },
                        ),
                        3.horizontalSpace,
                        RotatedBox(
                          quarterTurns: 3,
                          child: GetBuilder<CoatchHomeController>(
                            builder: (controller) => Text(
                                controller.periodDay == 'DayPeriod.am'
                                    ? StringTranslateExtension('après-midi').tr()
                                    : StringTranslateExtension('matin').tr(),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark
                                )
                            ).tr(),
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: InkWell(
                        onTap: (){
                          Get.to(CoatchCandidatList());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Gry3, width: 1.2.w),
                              borderRadius:
                              BorderRadius.all(Radius.circular(12.r))
                          ),
                          width: 335.w,
                          height: 93.h,
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  5.verticalSpace,
                                  Row(
                                    children: [
                                      23.horizontalSpace,
                                      Icon(
                                        IconlyBroken.user_3,
                                        size: 28.sp,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        "candidats",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Dark,
                                        ),
                                      ).tr(),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 25.0.h),
                                    child: Row(
                                      children: [
                                        GetBuilder<CoatchHomeController>(
                                            builder:(controller) => Text(
                                              controller.candidatLength.toString(),
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontFamily: 'cairo',
                                                    color: Dark)
                                            ),
                                        ),
                                        5.horizontalSpace,
                                        Text(
                                          "candidats",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo',
                                            color: Dark,
                                          ),
                                        ).tr(),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              const Spacer(),
                               Padding(
                                 padding: EdgeInsets.symmetric(horizontal: 17.w),
                                 child: Icon(
                                   // isar ? IconlyBroken.arrow_left_2 :
                                   IconlyBroken.arrow_right_2,
                                   color: PrimaryColor,
                                   size: 29.sp,
                                 ),
                               )
                            ],
                          ),
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    controller.seances.isNotEmpty ?
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "todaycandidate",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold,
                            color: Dark
                        ),
                      ).tr(),
                    ) :
                    Padding(
                      padding: EdgeInsets.only(top: 30.0.w),
                      child: Center(
                        child: Text(
                          "",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Dark),
                        ),
                      ),
                    ),
                    15.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                      child: SizedBox(
                        height: 150.h,
                        child: GetBuilder<CoatchHomeController>(
                          init: CoatchHomeController(),
                          builder:(controller)=>  ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.seances.length ,
                            itemBuilder: (BuildContext context, int index) {
                              final candidat = controller.candidats[index];
                              return Row(
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 5.0.w),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(
                                                      CoatchSeanceProfile() , arguments: [controller.seances[index].id ]
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 150.w,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Gry3,
                                                            width: 1.2.w
                                                        ),
                                                        borderRadius: BorderRadius.all(Radius.circular(12.r))),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        const Spacer(),
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                                                          child: CachedNetworkImage(
                                                            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                                            imageUrl: '$canpict/${candidat.photo}',
                                                            fit: BoxFit.cover,
                                                            height: 60.h,
                                                            width: 60.h,
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Text(
                                                            candidat.name.toString(),
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontFamily: 'cairo',
                                                                color: Dark)),
                                                        const Spacer(),
                                                        Text(
                                                            candidat.schoolName.toString(),
                                                            style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontFamily: 'cairo',
                                                              color: Gry3,
                                                            )),
                                                        const Spacer(),
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                );
                            },
                          ),
                        ),
                      ),
                    ),
                    14.verticalSpace,
                    controller.seances.isNotEmpty ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Text(
                        "seancetoday",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.bold,
                            color: Dark),
                      ).tr(),
                    ) : Padding(
                      padding: EdgeInsets.only(top: 30.0.w),
                      child: Center(
                        child: Text(
                          "noseancetoday",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Dark),
                        ).tr(),
                      ),
                    ),
                    5.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                      child: SizedBox(
                        height: 150.h,
                        child: GetBuilder<CoatchHomeController>(
                          init: CoatchHomeController(),
                          builder: (controller)=> ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.seances.length ,
                            itemBuilder: (BuildContext context, int index) {
                              final seance = controller.seances[index];
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 5.0.w),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(
                                                      CoatchSeanceProfile() , arguments: [controller.seances[index].id]
                                                  );
                                                },
                                                child: Container(
                                                  width: 150.w,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Gry3,
                                                          width: 1.2.w),
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              12.r))),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Spacer(),
                                                      ClipRRect(
                                                        borderRadius:
                                                        BorderRadius.all(Radius.circular(50.r)),
                                                        child: Image.asset(
                                                          'assets/images/seance.png',
                                                          fit: BoxFit.cover,
                                                          height: 60.h,
                                                          width: 60.h,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                          seance.dateStart.toString(),
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontFamily: 'cairo',
                                                              color: Dark)),
                                                      const Spacer(),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          Text(
                                                            'de',
                                                            style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontFamily: 'cairo',
                                                              color: Gry3,
                                                            ),
                                                          ).tr(),
                                                          5.horizontalSpace,
                                                          Text(
                                                              seance.text!.split('-')[0],
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontFamily: 'cairo',
                                                                color: Gry3,
                                                              )),
                                                          5.horizontalSpace,
                                                          Text(
                                                            'vers',
                                                            style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontFamily: 'cairo',
                                                              color: Gry3,
                                                            ),
                                                          ).tr(),
                                                          5.horizontalSpace,
                                                          Text(
                                                              seance.text!.split('-')[1],
                                                              style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontFamily: 'cairo',
                                                                color: Gry3,
                                                              )),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    15.verticalSpace,
                  ],
                ),
            ),
          ),
      ),
    );
  }
}
