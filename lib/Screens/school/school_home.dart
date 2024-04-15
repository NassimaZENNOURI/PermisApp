import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/school/school_candidat_list.dart';
import 'package:permisapp/Screens/school/school_car_list.dart';
import 'package:permisapp/Screens/school/school_coatch_list.dart';
import 'package:permisapp/Screens/school/school_facture_list.dart';
import 'package:permisapp/Screens/school/school_seances_list.dart';
import '../../Components/appVars.dart';
import '../../controllers/school/home_screen_controller.dart';

class SchoolHome extends StatelessWidget {
  const SchoolHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isar = true;
    String curr = Localizations.localeOf(context).toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  24.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: SecondaryColor.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Dark,
                            ),
                          ).tr(),
                        ),
                        5.horizontalSpace,
                        GetBuilder<HomeScreenController>(
                          builder:(controller) => Text(
                            controller.user.name.toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold,
                              color: Dark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(SchoolFactureList());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: SecondaryColor, width: 1.2.w),
                              borderRadius: BorderRadius.all(Radius.circular(12.r))),
                          width: 150.w,
                          height: 160.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Icon(
                                IconlyBroken.graph,
                                size: 50.sp,
                                color: SecondaryColor,
                              ),
                              const Spacer(),
                              GetBuilder<HomeScreenController>(
                                init: HomeScreenController(),
                                builder:(controller) =>  Text(
                                      controller.factureLength.toString(),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: Dark,
                                      ),
                                    ),
                              ),
                              Text(
                                    "factures",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                      color: Dark,
                                    ),
                                  ).tr(),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      14.horizontalSpace,
                      InkWell(
                        onTap: (){
                          Get.to(SchoolSeanceList());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: SecondaryColor, width: 1.2.w),
                              borderRadius: BorderRadius.all(Radius.circular(12.r))),
                          width: 152.w,
                          height: 160.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Icon(
                                IconlyBroken.document,
                                size: 50.sp,
                                color: SecondaryColor,
                              ),
                              const Spacer(),
                              GetBuilder<HomeScreenController>(
                                builder:(controller) => Text(
                                  controller.seancesLength.toString(),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                ),
                              ),
                              5.horizontalSpace,
                              Text(
                                "seances",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'cairo',
                                  color: Dark,
                                ),
                              ).tr(),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.to(const SchoolCandidatsList());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color:PrimaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(12.r))),
                      width: 335.w,
                      height: 110.h,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              13.verticalSpace,
                              Row(
                                children: [
                                  23.horizontalSpace,
                                  Icon(
                                    IconlyBroken.user_3,
                                    size: 28.sp,
                                    color: PrimaryColor,
                                  ),
                                  5.horizontalSpace,
                                Text(
                                  "candidats",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: PrimaryColor,
                                  ),
                                ).tr(),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  children: [
                                    GetBuilder<HomeScreenController>(
                                      builder:(controller) => Text(
                                        controller.candidatLength.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Dark,
                                        ),
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
                              isar
                                  ? IconlyBroken.arrow_left_2
                                  : IconlyBroken.arrow_right_2,
                              color: PrimaryColor,
                              size: 29.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  14.verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.to(const SchoolCarsList());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: PrimaryColor.withOpacity(0.2),
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.r))),
                      width: 335.w,
                      height: 110.h,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              13.verticalSpace,
                              Row(
                                children: [
                                  23.horizontalSpace,
                                  Icon(
                                    IconlyBroken.ticket,
                                    size: 28.sp,
                                    color: PrimaryColor,
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    "cars",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                      color: PrimaryColor,
                                    ),
                                  ).tr(),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  children: [
                                    GetBuilder<HomeScreenController>(
                                      init : HomeScreenController(),
                                      builder:(controller)=> Text(
                                        controller.carsLength.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Dark,
                                        ),
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      "cars",
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
                              isar
                                  ? IconlyBroken.arrow_left_2
                                  : IconlyBroken.arrow_right_2,
                              color: PrimaryColor,
                              size: 29.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  14.verticalSpace,
                  InkWell(
                    onTap: () {
                      Get.to(const SchoolCoatchList());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: PrimaryColor.withOpacity(0.2),
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.r))),
                      width: 335.w,
                      height: 110.h,
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              13.verticalSpace,
                              Row(
                                children: [
                                  23.horizontalSpace,
                                  Icon(
                                    IconlyBroken.graph,
                                    size: 28.sp,
                                    color: PrimaryColor,
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    "coatch",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                      color: PrimaryColor,
                                    ),
                                  ).tr(),
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 25.w),
                                child: Row(
                                  children: [
                                    GetBuilder<HomeScreenController>(
                                      builder:(controller) => Text(
                                        controller.coatchLength.toString(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Dark,
                                        ),
                                      ),
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      "coatch",
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
                              isar
                                  ? IconlyBroken.arrow_left_2
                                  : IconlyBroken.arrow_right_2,
                              color: PrimaryColor,
                              size: 29.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
