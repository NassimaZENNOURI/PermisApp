import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/coatch/coach_profile_controller.dart';
import 'coatch_notification_page.dart';

class CoatchProfile extends StatelessWidget {
  const CoatchProfile({Key? key}) : super(key: key);

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
      body: GetBuilder<CoachProfileController>(
        init: CoachProfileController(),
        builder:(controller)=>controller.isLoading.value ? const Loading() : SingleChildScrollView(
          child: Column(
            children: [
              21.verticalSpace,
              Center(
                child: Column(
                  children: [
                    GetBuilder<CoachProfileController>(
                      builder:(controller)=> ClipRRect(
                          borderRadius:
                          BorderRadius.all(Radius.circular(90.r)),
                          child: CachedNetworkImage(
                            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            imageUrl: '$mopict/${controller.coach.photo}',
                            width: 100.w,
                            height: 100.w,
                            fit: BoxFit.cover,
                          )),
                    ),
                    10.verticalSpace,
                    GetBuilder<CoachProfileController>(
                      builder:(controller)=>  Text(
                        controller.coach.name.toString(),
                        style: TextStyle(
                          color: Dark,
                          fontFamily: 'cairo',
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    GetBuilder<CoachProfileController>(
                      builder:(controller)=> Text(
                        controller.coach.school_name.toString(),
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
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12.r))
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.verticalSpace,
                              const Text('fullname', style: TextStyle(color: Colors.black , ),).tr(),
                              GetBuilder<CoachProfileController>(
                                builder:(controller)=> TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: '  ${controller.coach.name}',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.h,
                                color: Gry3,
                              ),
                              20.verticalSpace,
                              const Text('email', style: TextStyle(color: Colors.black ),).tr(),
                              GetBuilder<CoachProfileController>(
                                builder:(controller)=> TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: '  ${controller.coach.email}',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.h,
                                color: Gry3,
                              ),
                              20.verticalSpace,
                              const Text('schoolname', style: TextStyle(color: Colors.black , ),).tr(),
                              GetBuilder<CoachProfileController>(
                                builder:(controller)=> TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: '  ${controller.coach.school_name}',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.h,
                                color: Gry3,
                              ),
                              20.verticalSpace,
                              const Text('datenaiss', style: TextStyle(color: Colors.black , ),).tr(),
                              GetBuilder<CoachProfileController>(
                                builder:(controller)=> TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: '  ${controller.coach.birthdate}',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.h,
                                color: Gry3,
                              ),
                              20.verticalSpace,
                              const Text('Genre', style: TextStyle(color: Colors.black , ),).tr(),
                              GetBuilder<CoachProfileController>(
                                builder:(controller)=>  TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: '  ${controller.coach.sexe.toString()=="1"?tr('Homme'):tr('Femme')}',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.h,
                                color: Gry3,
                              ),
                              20.verticalSpace,
                              const Text('cin', style: TextStyle(color: Colors.black , ),).tr(),
                              GetBuilder<CoachProfileController>(
                                builder:(controller)=>  TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: '  ${controller.coach.cni}',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.h,
                                color: Gry3,
                              ),
                              20.verticalSpace,
                              const Text('telephone', style: TextStyle(color: Colors.black , ),).tr(),
                              GetBuilder<CoachProfileController>(
                                builder:(controller)=>  TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: '  ${controller.coach.phoneNo}',
                                    hintStyle: const TextStyle(color: Colors.black),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                    labelStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              ],
                          ),
                        ),
                      ),
                    ),
                    15.verticalSpace,
                  ],
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
