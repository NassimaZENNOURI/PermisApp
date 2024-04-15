import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../Components/appVars.dart';
import '../../controllers/candidat/candidat_home_screen_controller.dart';
import '../../utils/services.dart';
import '../settings_page.dart';
import 'candidat_home.dart';
import 'candidat_profile.dart';
import 'candidat_seances_list.dart';

class CandidatDrawerNavigator extends StatelessWidget {
  const CandidatDrawerNavigator({Key? key}) : super(key: key);

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
                      GetBuilder<CandidatHomeScreenController>(
                        init: CandidatHomeScreenController(),
                        builder:(controller)=> ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(90.r)),
                          child: controller.candidat.photo == '' ? null : CachedNetworkImage(
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                            imageUrl: '$canpict/${controller.candidat.photo}',
                            width: 100.w,
                            height: 100.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      GetBuilder<CandidatHomeScreenController>(
                        builder:(controller)=> Text(
                          controller.candidat.name.toString(),
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      2.verticalSpace,
                      GetBuilder<CandidatHomeScreenController>(
                        builder:(controller)=> Text(
                          controller.candidat.email.toString(),
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
                        Navigator.pop(context);
                        Get.to(CandidatHome());
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
                    GetBuilder<CandidatHomeScreenController>(
                      builder:(controller)=> InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          Get.to(
                            CandidatProfile() , arguments: [controller.candidat]
                          );
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
                    ),
                    20.verticalSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Get.to(CandidatSeancesList());
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
                        Navigator.pop(context);
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
                    200.verticalSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        logOut(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            IconlyBroken.logout,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                          Text(
                            "logout",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'cairo',
                            ),
                          ).tr(),
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
