import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../Components/appVars.dart';
import '../../controllers/coatch/coatch_home_controller.dart';
import '../../utils/services.dart';
import 'coach_home_screen.dart';
import '../settings_page.dart';
import 'coatch_candidat_list.dart';
import 'coatch_profile.dart';
import 'coatch_seance_list.dart';

class CoatchDrawerNavigator extends StatelessWidget {
  const CoatchDrawerNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:  const BoxDecoration(
        gradient: LinearGradient(
          colors: [firstGrad, secondGrad],
          stops: [0.5, 1.0],
        ),
      ),
      child: Drawer(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Column(
            children: [
              71.verticalSpace,
              Center(
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(90.r)),
                          child: GetBuilder<CoatchHomeController>(
                            init: CoatchHomeController(),
                            builder:(controller)=> CachedNetworkImage(
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              imageUrl: '$mopict/${controller.coach.photo}',
                              width: 100.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          )),
                      15.verticalSpace,
                      GetBuilder<CoatchHomeController>(
                        builder:(controller)=> Text(
                          controller.coach.name.toString(),
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      2.verticalSpace,
                      GetBuilder<CoatchHomeController>(
                        builder:(controller)=>Text(
                          controller.coach.email.toString(),
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
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
                        Get.back(result: context);
                        Get.to(CoatchHomeScreen());
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
                        Get.back(result: context);
                        Get.to(CoatchCandidatList());
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
                        Get.back(result: context);
                        Get.to(CoatchProfile());
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
                            "personalfile",
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
                        Get.to(CoatchSeanceList());
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
                            "seances",
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
                    83.verticalSpace,
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
          )),
    );
  }
}
