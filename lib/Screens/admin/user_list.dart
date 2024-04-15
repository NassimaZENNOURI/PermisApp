import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../Components/functions.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/user_list_controller.dart';
import '../../utils/models/Users.dart';
import 'admin_home_screen.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.verticalSpace,
            Text(
              'users',
              style: TextStyle(
                color: Dark,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ).tr(),
            15.verticalSpace,
            GetBuilder<ListUsersController>(
              init: ListUsersController(),
              builder:(controller)=> TextField(
                  onChanged: (value) {
                    controller.update();
                  },
                  style: const TextStyle(color: gray),
                  controller: controller.searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20.h, horizontal: 13.w),
                    suffixIcon: const Icon(
                      IconlyBroken.search,
                      color: gray,
                    ),
                    focusColor: PrimaryColor,
                    labelText: StringTranslateExtension("search").tr(),
                    labelStyle: TextStyle(
                        color: gray,
                        fontWeight: FontWeight.bold,
                        fontFamily: "cairo",
                        fontSize: 14.sp),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
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
            15.verticalSpace,
            Expanded(
                child: GetBuilder<ListUsersController>(
                  init: ListUsersController(),
                  builder:(controller)=> ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.search().length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = controller.search()[index];
                      return Column(
                        children: [
                          14.verticalSpace,
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                    const Color(0xFFC9C9C9).withOpacity(0.12),
                                    blurRadius: 20,
                                  ),
                                ],
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.r))),
                            width: 335.w,
                            height: 95.h,
                            child: Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      13.verticalSpace,
                                      Row(
                                        children: [
                                          23.horizontalSpace,
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                user.name.toString(),
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'cairo',
                                                  color: Dark,
                                                ),
                                              ),
                                              Text(
                                                user.email.toString(),
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: 'cairo',
                                                  color: gray,
                                                ),
                                              ),
                                            ],
                                          ),
                                          11.horizontalSpace,
                                          Column(
                                            children: [
                                              Text(
                                                StringTranslateExtension(user.role.toString().split('_')[1]).tr(),
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'cairo',
                                                  color: secondGrad,
                                                ),
                                              ),
                                              Text(
                                                user.status.toString() == "0" ? StringTranslateExtension('inactif').tr() : StringTranslateExtension('actif').tr(),
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontFamily: 'cairo',
                                                  color: SecondaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                                  child: GetBuilder<ListUsersController>(
                                    init: ListUsersController(),
                                    builder:(controller)=> FocusedMenuHolder(
                                      menuWidth: MediaQuery.of(context).size.width * 0.50,
                                      blurSize: 5.0,
                                      menuItemExtent: 45,
                                      menuBoxDecoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(25.0.r))),
                                      duration: const Duration(milliseconds: 100),
                                      animateMenuItems: false,
                                      blurBackgroundColor: Colors.black54,
                                      bottomOffsetHeight: 100,
                                      openWithTap: true,
                                      menuItems: <FocusedMenuItem>[
                                        FocusedMenuItem(
                                            title: Text(
                                              user.status.toString() == "0" ? StringTranslateExtension('tashghil').tr() : StringTranslateExtension('ighla9').tr(),
                                              style: TextStyle(
                                                color: user.status.toString() != "0"
                                                    ? const Color(0XFFFF0000)
                                                    : Dark,
                                                fontFamily: 'cairo',
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                            trailingIcon: const Icon(
                                              IconlyBroken.edit,
                                            ),
                                            onPressed: () async {
                                              controller.UpdateStatus(user.id!, user.status!, user.email!, user.name!);
                                            }),
                                        FocusedMenuItem(
                                            title: Text(
                                              "delete",
                                              style: TextStyle(
                                                color: const Color(0XFFFF0000),
                                                fontFamily: 'cairo',
                                                fontSize: 14.sp,
                                              ),
                                            ).tr(),
                                            trailingIcon: const Icon(
                                              Icons.delete,
                                              color: Color(0XFFFF0000),
                                            ),
                                            onPressed: () {
                                              DeletePopup(context, 'accountdelete', user.id! , 'user', const AdminHomeScreen());
                                            }),
                                      ],
                                      onPressed: () {},
                                      child: Icon(
                                        user.id != 0 ?
                                        IconlyBroken.more_square : null,
                                        color: Dark,
                                        size: 23.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          10.verticalSpace,
                        ],
                      );
                    },

                  ),
                )),
          ],
        ),
      ),
      // floatingActionButton: SizedBox(
      //   width: 60.w,
      //   height: 60.w,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       //Get.to(AddAdmin());
      //     },
      //     backgroundColor: PrimaryColor,
      //     child: Icon(
      //       IconlyBold.add_user,
      //       color: Colors.white,
      //       size: 27.sp,
      //     ),
      //   ),
      // ),
    );
  }
}
