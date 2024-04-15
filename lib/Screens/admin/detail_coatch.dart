import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Components/functions.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/admin_coach_detail_controller.dart';
import 'admin_home_screen.dart';

class DetailCoach extends StatelessWidget {
  const DetailCoach({super.key});


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
            !isar ? IconlyBroken.arrow_left_2 : IconlyBroken.arrow_right_2,
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
                  GetBuilder<AdminCoachDetailController>(
                    init: AdminCoachDetailController(),
                    builder:(controller)=> ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                        child:  CachedNetworkImage(
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                          imageUrl: '$mopict/${controller.coach.photo}',
                          progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        )
                    ),
                  ),
                  10.verticalSpace,
                  GetBuilder<AdminCoachDetailController>(
                    builder:(controller)=> Text(
                      '${controller.coach.name}',
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  GetBuilder<AdminCoachDetailController>(
                    builder:(controller)=> Text(
                      '${controller.coach.email}',
                      style: TextStyle(
                        color: gray,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Gry3,width: 1.2),
                          borderRadius: BorderRadius.all(Radius.circular(12.r))),
                      child: Padding(
                        padding:EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            const Text('fullname', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCoachDetailController>(
                              builder:(controller)=> TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.coach.name}',
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
                            const Text('schoolname', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCoachDetailController>(
                              builder:(controller)=> TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.coach.school_name}',
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
                            const Text('datenaiss', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCoachDetailController>(
                              builder:(controller)=>TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.coach.birthdate}',
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
                            const Text('Genre', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCoachDetailController>(
                              builder:(controller)=>TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.coach.sexe.toString()=="1"?'Homme'.tr():'Femme'.tr()}',
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
                            const Text('cin', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCoachDetailController>(
                              builder:(controller)=>TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.coach.cni}',
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
                            const Text('telephone', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCoachDetailController>(
                              builder:(controller)=>TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.coach.phoneNo}',
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            20.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            12.verticalSpace,
            GetBuilder<AdminCoachDetailController>(
              builder:(controller)=> ElevatedButton(
              onPressed: () {
                DeletePopup(context, 'deleteaccount'.tr(), controller.coach.id!, 'coatch', AdminHomeScreen()
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffD16868),
              ),
              child: Text( 'delete',style: TextStyle(
                  fontSize: 14.sp,fontFamily: "cairo",fontWeight: FontWeight.bold,color: Colors.white
              ),
              ).tr(),
            ),
          ),

            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
