import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/school/school_candidat_list.dart';
import 'package:permisapp/Screens/school/school_car_list.dart';
import 'package:permisapp/Screens/school/school_coatch_list.dart';
import 'package:permisapp/Screens/school/school_detail_profile.dart';
import 'package:permisapp/Screens/school/school_facture_list.dart';
import 'package:permisapp/Screens/school/school_home_screen.dart';
import 'package:permisapp/Screens/school/school_seances_list.dart';
import 'package:permisapp/controllers/school/home_screen_controller.dart';

import '../../Components/appVars.dart';
import '../../controllers/school/school_edit_controller.dart';
import '../../utils/services.dart';
import '../settings_page.dart';

class SchoolDrawerNavigator extends StatelessWidget {
  const SchoolDrawerNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [firstGrad, secondGrad],
          stops: [0.5, 1.0],
        ),
      ),
      child: Drawer(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                31.verticalSpace,
                Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(90.r)),
                          child: GetBuilder<HomeScreenController>(
                            init: HomeScreenController(),
                            builder: (controller) => CachedNetworkImage(
                              width: 100.w,
                              height: 100.w,
                              fit: BoxFit.cover,
                              imageUrl: '$pict/${controller.school.logo}',
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                        ),
                        15.verticalSpace,
                        GetBuilder<HomeScreenController>(
                          init: HomeScreenController(),
                          builder: (controller) => Text(
                            controller.user.name.toString(),
                            style: TextStyle(
                              fontFamily: 'cairo',
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        2.verticalSpace,
                        GetBuilder<HomeScreenController>(
                          builder: (controller) => Text(
                            controller.user.email.toString(),
                            style: TextStyle(
                              fontFamily: 'cairo',
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                20.verticalSpace,
                Container(
                  color: Colors.white,
                  height: 1.sp,
                ),
                21.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.0.w),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(SchoolHomeScreen());
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.home,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            11.horizontalSpace,
                            Text(
                              "homepage",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                              ),
                            ).tr()
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(SchoolCandidatsList());
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.user_3,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            11.horizontalSpace,
                            Text(
                              "candidats",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                              ),
                            ).tr()
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Get.to(SchoolCarsList());
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.ticket,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            11.horizontalSpace,
                            Text(
                              "cars",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                              ),
                            ).tr()
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Get.to(SchoolCoatchList());
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.user_3,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            11.horizontalSpace,
                            Text(
                              "coach",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                              ),
                            ).tr()
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      GetBuilder<SchoolEditController>(
                        init: SchoolEditController(),
                        builder:(controller)=> InkWell(
                          onTap: () {
                            Get.to(SchoolDetailsProfile() , arguments: [controller.schooluser]);
                          },
                          child: Row(
                            children: [
                              Icon(
                                IconlyBroken.profile,
                                color: Colors.white,
                                size: 24.sp,
                              ),
                              11.horizontalSpace,
                              Text(
                                "profilefile",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontFamily: 'cairo',
                                ),
                              ).tr()
                            ],
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Get.to(SchoolFactureList());
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.graph,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            11.horizontalSpace,
                            Text(
                              "state",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                              ),
                            ).tr()
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Get.to(SchoolSeanceList());
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.calendar,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            11.horizontalSpace,
                            Text(
                              "takdir",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                              ),
                            ).tr()
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Get.to(SettingsPage());
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.setting,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            11.horizontalSpace,
                            Text(
                              "settings",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                              ),
                            ).tr()
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Get.back(result: context);
                          logOut(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconlyBroken.logout,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                            11.horizontalSpace,
                            Text(
                              "logout",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                              ),
                            ).tr()
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
