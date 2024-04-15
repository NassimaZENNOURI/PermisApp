import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/school/school_add_candidat1.dart';
import 'package:permisapp/Screens/school/school_candidat_detail.dart';
import 'package:permisapp/Screens/school/school_candidat_edit.dart';
import 'package:permisapp/Screens/school/school_home_screen.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../Components/functions.dart';
import '../../controllers/school/school_candidat_list_controller.dart';

class SchoolCandidatsList extends StatelessWidget {
  const SchoolCandidatsList({Key? key}) : super(key: key);

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
      body: GetBuilder<SchoolCandidatListController>(
        init: SchoolCandidatListController(),
        builder: (controller) => controller.isLoading.value
            ? const Loading()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    25.verticalSpace,
                    Text(
                      'candidats',
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ).tr(),
                    15.verticalSpace,
                    GetBuilder<SchoolCandidatListController>(
                      init: SchoolCandidatListController(),
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
                          )
                      ),
                    ),
                    15.verticalSpace,
                    Expanded(
                        child: GetBuilder<SchoolCandidatListController>(
                          init: SchoolCandidatListController(),
                          builder: (controller) => ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.search().length,
                          itemBuilder: (BuildContext context, int index) {
                            final candidate = controller.search()[index];

                            return InkWell(
                              onTap: (){
                                Get.to(
                                    SchoolCandidatDetail() , arguments: [candidate]
                                );
                              },
                              child: Column(
                                children: [
                                  14.verticalSpace,
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFC9C9C9)
                                                .withOpacity(0.12),
                                            blurRadius: 20,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.r))),
                                    width: 335.w,
                                    height: 93.h,
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            13.verticalSpace,
                                            Row(
                                              children: [
                                                23.horizontalSpace,
                                                ClipRRect(
                                                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                                                    child: CachedNetworkImage(
                                                      width: 55.w,
                                                      height: 55.h,
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                          '$canpict/${candidate.photo}',
                                                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
                                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                                    )),
                                                16.horizontalSpace,
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      candidate.name.toString(),
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'cairo',
                                                        color: Dark,
                                                      ),
                                                    ),
                                                    Text(
                                                      candidate.schoolName.toString(),
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontFamily: 'cairo',
                                                        color: gray,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 17.w),
                                          child: FocusedMenuHolder(
                                            menuWidth: MediaQuery.of(context).size.width * 0.50,
                                            blurSize: 5.0,
                                            menuItemExtent: 45,
                                            menuBoxDecoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius: BorderRadius.all(Radius.circular(25.0.r))), duration:
                                                const Duration(milliseconds: 100),
                                            animateMenuItems: false,
                                            blurBackgroundColor: Colors.black54,
                                            bottomOffsetHeight: 100,
                                            openWithTap: true,
                                            menuItems: <FocusedMenuItem>[
                                              FocusedMenuItem(
                                                  title: Text(
                                                    "details",
                                                    style: TextStyle(
                                                      color: Dark,
                                                      fontFamily: 'cairo',
                                                      fontSize: 14.sp,
                                                    ),
                                                  ).tr(),
                                                  trailingIcon: const Icon(
                                                      Icons.description_outlined),
                                                  onPressed: () async {
                                                    Get.to(
                                                      SchoolCandidatDetail() , arguments: [candidate]
                                                    );
                                                  }),
                                              FocusedMenuItem(
                                                  title: Text(
                                                    "edit",
                                                    style: TextStyle(
                                                      color: Dark,
                                                      fontFamily: 'cairo',
                                                      fontSize: 14.sp,
                                                    ),
                                                  ).tr(),
                                                  trailingIcon: const Icon(IconlyBroken.edit),
                                                  onPressed: () async {
                                                    Get.to(
                                                        SchoolCandidatEdit() , arguments: [candidate]
                                                    );
                                                  }),
                                              FocusedMenuItem(
                                                  title: Text(
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
                                                    DeletePopup(context, StringTranslateExtension('deleteaccount').tr(), candidate.id!, 'candidat', SchoolHomeScreen());
                                                  }),
                                            ],
                                            onPressed: () {},
                                            child: Icon(
                                              //id[i]!=0?
                                              IconlyBroken.more_square,
                                              //:null,
                                              color: Gry3,
                                              size: 23.sp,
                                            ),
                                          ),
                                        ),
                                        10.verticalSpace,
                                      ],
                                    ),
                                  ),
                                  10.verticalSpace,
                                ],
                              ),
                            );
                          }),
                    ))
                  ],
                ),
              ),
      ),
      floatingActionButton: SizedBox(
        width: 60.w,
        height: 60.w,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(SchoolAddCandidat1());
          },
          backgroundColor: PrimaryColor,
          child: Icon(
            IconlyBold.add_user,
            color: Colors.white,
            size: 27.sp,
          ),
        ),
      ),
    );
  }
}
