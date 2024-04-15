import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/school/school_facture_profile.dart';
import 'package:permisapp/Screens/school/school_home_screen.dart';
import 'package:permisapp/utils/models/Seance.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../Components/functions.dart';
import '../../controllers/school/school_facture_list_controller.dart';

class SchoolFactureList extends StatelessWidget {
  const SchoolFactureList({Key? key}) : super(key: key);

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
      body: GetBuilder<SchoolFactureListController>(
        init: SchoolFactureListController(),
        builder:(controller)=> controller.isLoading.value ? const Loading() :  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              25.verticalSpace,
              Text(
                'facture',
                style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ).tr(),
              15.verticalSpace,
              GetBuilder<SchoolFactureListController>(
                init: SchoolFactureListController(),
                builder:(controller)=> TextField(
                    onChanged: (value) {
                      controller.update();
                    },
                    controller: controller.searchController,
                    style: const TextStyle(color: gray),
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
                  child: GetBuilder<SchoolFactureListController>(
                    init: SchoolFactureListController(),
                    builder:(controller) => ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.search().length,
                      itemBuilder: (BuildContext context, int index) {
                        final facture = controller.search()[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            14.verticalSpace,
                            InkWell(
                              onTap: (){
                                Get.to(
                                    SchoolFactureProfile() , arguments: [facture]
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0.h),
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
                                width: 330.w,
                                height: 93.h,
                                child: Row(
                                  children: [
                                    13.verticalSpace,
                                    Row(
                                      children: [
                                        16.horizontalSpace,
                                        SizedBox(
                                          width: 150.w,
                                          child: Padding(
                                            padding:
                                            EdgeInsets.symmetric(vertical: 30.w),
                                            child: Text(
                                              facture.name.toString(),
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'cairo',
                                                color: Dark,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.symmetric(vertical: 30.w),
                                          child: Row(
                                            children: [
                                              const Text('Dh'),
                                              5.horizontalSpace,
                                              Text(
                                                facture.montantpaye.toString(),
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'cairo',
                                                  color: SecondaryColor,
                                                ),
                                              ),
                                              5.horizontalSpace,
                                              const Text('Dh'),
                                              12.horizontalSpace,
                                              5.horizontalSpace,
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    facture.name.toString() != StringTranslateExtension("No_Results").tr() ?
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 17.w),
                                      child: FocusedMenuHolder(
                                        menuWidth:
                                        MediaQuery.of(context).size.width *
                                            0.50,
                                        blurSize: 5.0,
                                        menuItemExtent: 45,
                                        menuBoxDecoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25.0.r))),
                                        duration:
                                        const Duration(milliseconds: 100),
                                        animateMenuItems: false,
                                        blurBackgroundColor: Colors.black54,
                                        bottomOffsetHeight: 100,
                                        openWithTap: true,
                                        menuItems: <FocusedMenuItem>[
                                          FocusedMenuItem(
                                              title: Text(
                                                "detail",
                                                style: TextStyle(
                                                  color: Dark,
                                                  fontFamily: 'cairo',
                                                  fontSize: 14.sp,
                                                ),
                                              ).tr(),
                                              trailingIcon: const Icon(
                                                  IconlyBroken.profile),
                                              onPressed: () {
                                                Get.to(
                                                    SchoolFactureProfile() , arguments: [facture]
                                                );
                                              }),
                                          FocusedMenuItem(
                                              title:Text(
                                                "delete",
                                                style: TextStyle(
                                                  color:
                                                  const Color(0XFFFF0000),
                                                  fontFamily: 'cairo',
                                                  fontSize: 14.sp,
                                                ),
                                              ).tr(),
                                              trailingIcon: const Icon(
                                                Icons.delete,
                                                color: Color(0XFFFF0000),
                                              ),
                                              onPressed: () {
                                                DeletePopup(context, StringTranslateExtension('deleteaccount').tr(), facture.id!, 'facture', const SchoolHomeScreen());
                                              }),
                                        ],
                                        onPressed: () {},
                                        child: Icon(
                                          //id[i] != 0 ?
                                          IconlyBroken.more_square,
                                          //: null,
                                          color: Gry3,
                                          size: 23.sp,
                                        ),
                                      ),
                                    )
                                    : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },

                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
