import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';

import '../../Components/appVars.dart';
import '../../controllers/admin/edit_controller.dart';

class EditPassword extends StatelessWidget {
  const EditPassword({Key? key}) : super(key: key);

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
                  10.verticalSpace,
                  GetBuilder<EditController>(
                    init: EditController(),
                    builder: (controller) => Text(
                      controller.admin.name.toString(),
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  GetBuilder<EditController>(
                    builder: (controller) => Text(
                      controller.admin.email.toString(),
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
                          builder: (controller) => TextField(
                              obscureText: controller.isObscure1.value,
                              style: TextStyle(
                                  color: gray,
                                  fontFamily: 'cairo',
                                  fontSize: 14.sp),
                              controller: controller.previousPassword,
                              decoration: InputDecoration(
                                hintText: 'oldpass'.tr(),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isObscure1.value ? Icons.visibility_off : Icons.visibility
                                    ,color: gray,
                                  ) ,
                                  onPressed: () => controller.toggleObscure1(),
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.9.w,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: const BorderSide(
                                      color: Gry3,
                                      width: 1.9,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.9,
                                    )
                                ),
                              )
                          ),
                        ),
                        10.verticalSpace,
                        GetBuilder<EditController>(
                          builder: (controller) => TextField(
                              obscureText: controller.isObscure2.value,
                              style: TextStyle(
                                  color: gray,
                                  fontFamily: 'cairo',
                                  fontSize: 14.sp),
                              controller: controller.newPasswordController,
                              decoration: InputDecoration(
                                hintText: 'newpass'.tr(),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 13.w),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isObscure2.value ? Icons.visibility_off : Icons.visibility
                                    ,color: gray,
                                  ) ,
                                  onPressed: () => controller.toggleObscure2(),
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.9.w,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: const BorderSide(
                                      color: Gry3,
                                      width: 1.9,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.9,
                                    )),
                              )),
                        ),
                        10.verticalSpace,
                        GetBuilder<EditController>(
                          builder: (controller) => TextField(
                              obscureText: controller.isObscure3.value,
                              style: TextStyle(
                                  color: gray,
                                  fontFamily: 'cairo',
                                  fontSize: 14.sp),
                              controller: controller.confirmPasswordController,
                              decoration: InputDecoration(
                                hintText: 'confirmpass'.tr(),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.h, horizontal: 13.w),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isObscure3.value ? Icons.visibility_off : Icons.visibility
                                    ,color: gray,
                                  ) ,
                                  onPressed: () => controller.toggleObscure3(),
                                ),
                                focusColor: PrimaryColor,
                                labelStyle: TextStyle(
                                    color: gray,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "cairo",
                                    fontSize: 14.sp),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1.9.w,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: const BorderSide(
                                      color: Gry3,
                                      width: 1.9,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.r)),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1.9,
                                    )),
                              )),
                        ),
                        41.verticalSpace,
                        GetBuilder<EditController>(
                          builder: (controller) => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: PrimaryColor,
                            ),
                            onPressed: () async {
                              controller.UpdatePassword(
                                  context,
                                  controller.admin.id!,
                                  controller.previousPassword.text,
                                  controller.newPasswordController.text,
                                  controller.confirmPasswordController.text);
                            },
                            child: const Text('continue',style: TextStyle(color: Colors.white),).tr(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            90.verticalSpace,
          ],
        ),
      ),
    );
  }
}
