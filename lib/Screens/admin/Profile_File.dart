import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';

import '../../Components/Loading.dart';
import '../../Components/appVars.dart';

import '../../controllers/admin/edit_controller.dart';
import '../../utils/services.dart';
import 'edit_password.dart';
import 'edit_profile.dart';

class Profile_File extends StatelessWidget {
  const Profile_File({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isar = true;
    String curr = Localizations.localeOf(context).toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }
    return //control.isLoading == true ? Loading():
    Scaffold(
      resizeToAvoidBottomInset:true,
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
        title: Text('profileadmin' ,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'cairo',
            fontSize: 16.sp,
          ),
        ).tr(),
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
      body: GetBuilder<EditController>(
        init: EditController(),
        builder: (controller) {
          return controller.isLoading.value ? Loading(): SingleChildScrollView(
            child: Column(
              children: [
                21.verticalSpace,
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Container(
                          height: 450.h,
                          width: 375.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            gradient: LinearGradient(
                              colors: [firstGrad.withOpacity(0.5), secondGrad.withOpacity(0.5) ],
                              stops: [0.5, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 120.h , horizontal: 10.w),
                      child : Column(
                        children: [
                          40.verticalSpace,
                          GetBuilder<EditController>(
                            init: EditController(),
                            builder: (controller) => Text(
                              controller.nameController.text,
                              style: TextStyle(
                                color: Dark,
                                fontFamily: 'cairo',
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          GetBuilder<EditController>(
                            builder: (controller)=> Text(
                              controller.emailController.text,
                              style: TextStyle(
                                color: gray,
                                fontFamily: 'cairo',
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          20.verticalSpace,
                          20.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: Column(
                              children: [
                                GetBuilder<EditController>(
                                  builder:(controller)=> InkWell(
                                    onTap: (){
                                      Get.to(EditProfile(controller.admin));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: PrimaryColor,width: 1.2.w),
                                          borderRadius: BorderRadius.all(Radius.circular(12.r))),
                                      width: 335.w,
                                      height: 65.h,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          19.horizontalSpace,
                                          Padding(
                                            padding:   EdgeInsets.symmetric( vertical: 19.h),
                                            child: Icon(
                                              IconlyBroken.profile,
                                              color: PrimaryColor,
                                              size: 27.sp,
                                            ),
                                          ),
                                          40.horizontalSpace,
                                          Padding(
                                            padding:   EdgeInsets.symmetric( vertical: 19.h),
                                            child:Text( 'editprof',style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo',
                                              color: PrimaryColor,
                                            ),
                                            ).tr(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                15.verticalSpace,
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                        PageTransition(type: PageTransitionType.leftToRight,
                                            duration: const Duration(milliseconds: 450),
                                            child:const EditPassword()
                                        )
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: PrimaryColor,width: 1.2.w),
                                        borderRadius: BorderRadius.all(Radius.circular(12.r))),
                                    width: 335.w,
                                    height: 65.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        19.horizontalSpace,
                                        Padding(
                                          padding:   EdgeInsets.symmetric( vertical: 19.h),
                                          child: Icon(
                                            IconlyBroken.unlock,
                                            color: PrimaryColor,
                                            size: 27.sp,
                                          ),
                                        ),
                                        40.horizontalSpace,
                                        Padding(
                                          padding:   EdgeInsets.symmetric( vertical: 19.h),
                                          child: Text( 'editpass',style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo',
                                            color: PrimaryColor,
                                          ),
                                          ).tr(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                41.verticalSpace,
                                InkWell(onTap: (){
                                  logOut(context);
                                },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(IconlyBroken.logout,color: const Color(0xFFFF0000),size: 26.sp,),
                                      12.horizontalSpace,
                                      Text('logout', style: TextStyle(
                                        color:  const Color(0xFFFF0000),
                                        fontFamily: 'cairo',
                                        fontSize: 14.sp,
                                      ),
                                      ).tr(),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 5.h),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(90.r)),
                          child: Image.asset(
                              'assets/images/adminpic.png',
                            height: 135.h,
                          ),
                      ),
                    ),
                  ],
                ),
                90.verticalSpace,
              ],
            ),
          );
        }
      ),
    );
  }
}
