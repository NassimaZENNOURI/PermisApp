import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';

import '../../Components/appVars.dart';
import '../../controllers/admin/edit_controller.dart';
import '../../utils/models/Users.dart';

class EditProfile extends StatelessWidget {

  User admin = User();
  EditProfile(this.admin, {super.key});

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
                  // ClipRRect(
                  //     borderRadius: BorderRadius.all(Radius.circular(90.r)),
                  //     child: Image.asset(
                  //       'assets/images/profilepic.jpg',
                  //       width: 100.w,
                  //     )),
                  10.verticalSpace,
                  // GetBuilder<EditController>(
                  //   init: EditController(),
                  //   builder:(controller)=> Text(
                  //     controller.nameController.text,
                  //     style: TextStyle(
                  //       color: Dark,
                  //       fontFamily: 'cairo',
                  //       fontSize: 14.sp,
                  //     ),
                  //   ),
                  // ),
                  Text( 'editprof',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontFamily: 'cairo',
                      color: PrimaryColor,
                      fontWeight: FontWeight.bold,
                      //decoration: TextDecoration.underline,
                    ),
                  ).tr(),
                  5.verticalSpace,
                  Text( 'noeditemail',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'cairo',
                      color: PrimaryColor,
                      fontWeight: FontWeight.w300 ,
                      decoration: TextDecoration.underline,
                      decorationColor: PrimaryColor
                    ),
                  ).tr(),
                  5.verticalSpace,
                  // GetBuilder<EditController>(
                  //   builder:(controller)=> Text(
                  //     controller.emailController.text,
                  //     style: TextStyle(
                  //       color: gray,
                  //       fontFamily: 'cairo',
                  //       fontSize: 14.sp,
                  //     ),
                  //   ),
                  // ),
                  // 20.verticalSpace,
                  20.verticalSpace,
                  Stack(
                    children: [
                      Center(
                        child: Container(
                            height: 430.h,
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0.w , vertical: 80.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('fullname',style: TextStyle(color: gray),).tr(),
                            5.verticalSpace,
                            GetBuilder<EditController>(
                              builder:(controller)=> TextField(
                                  style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                                  controller: controller.nameController,
                                  decoration: InputDecoration(
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                    suffixIcon: Icon(
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
                                    // enabledBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                    //     borderSide: const BorderSide(
                                    //       color: Gry3,
                                    //       width: 1.9,
                                    //     )),
                                    // focusedBorder: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                    //     borderSide: BorderSide(
                                    //       color: Theme.of(context).primaryColor,
                                    //       width: 1.9,
                                    //     )),
                                  )),
                            ),
                            40.verticalSpace,
                            const Text('email',style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                            5.verticalSpace,
                            GetBuilder<EditController>(
                              builder:(controller)=> TextField(
                                  enabled: false,
                                  style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp),
                                  controller: controller.emailController,
                                  decoration: InputDecoration(
                                    // filled: true,
                                    // fillColor: Colors.white,
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                    suffixIcon: const Icon(
                                      Icons.email,
                                      color: gray,
                                    ),
                                    focusColor: PrimaryColor,
                                    labelStyle: TextStyle(
                                        color: gray,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "cairo",
                                        fontSize: 14.sp),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                    //     borderSide: BorderSide(
                                    //       color: Colors.white,
                                    //       width: 1.9.w,
                                    //     )),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                        borderSide: const BorderSide(
                                          color: Gry3,
                                          width: 1.9,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(12.r)),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.9,
                                        )),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 220.w,
        height: 55.h,
        child: GetBuilder<EditController>(
          builder:(controller)=> FloatingActionButton.extended(
              backgroundColor: PrimaryColor,
              onPressed: () async {
                controller.UpdateUser(context, admin.id! , controller.nameController.text , admin.email! /*controller.emailController.text*/);
              },
              label: Text(
                "continue",
                style: TextStyle(fontSize: 16.sp, fontFamily: "cairo",color: Colors.white),
              ).tr(),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
            ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
