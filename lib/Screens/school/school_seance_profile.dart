import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/school/school_candidat_detail.dart';
import 'package:permisapp/Screens/school/school_home_screen.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../Components/functions.dart';
import '../../controllers/school/school_seance_detail_controller.dart';
import '../../controllers/school/school_seance_list_controller.dart';
import '../../utils/models/Seance.dart';
import '../coach/coatch_notification_page.dart';

class SchoolSeanceProfile extends StatelessWidget {
  Seance seance = Seance();
  SchoolSeanceProfile(this.seance, {super.key});
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
                  height: 44.h,
                  'assets/images/logo.png',
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
        backgroundColor: PrimaryColor,
        toolbarHeight: 80.h,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<SchoolSeanceListController>(
          init: SchoolSeanceListController(),
          builder:(controller) => controller.isLoading.value ? const Loading() : Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: Column(
              children: [
                30.verticalSpace,
                Text(
                  "seance",
                  style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ).tr(),
                20.verticalSpace,
                TextField(
                    readOnly: true,
                    style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: seance.schoolName.toString(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                      suffixIcon: const Icon(
                        Icons.location_city_rounded,
                        color: gray,
                      ),
                      focusColor: PrimaryColor,
                      labelStyle: TextStyle(
                          color: gray,
                          fontWeight: FontWeight.bold,
                          fontFamily: "cairo",
                          fontSize: 14.sp),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    )),
                10.verticalSpace,
                TextField(
                    readOnly: true,
                    style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: seance.moniteurName.toString(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                      suffixIcon: const Icon(
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
                    )),
                10.verticalSpace,
                TextField(
                    readOnly: true,
                    style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: seance.text.toString(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                      suffixIcon: const Icon(
                        Icons.timer,
                        color: gray,
                      ),
                      focusColor: PrimaryColor,
                      labelStyle: TextStyle(
                          color: gray,
                          fontWeight: FontWeight.bold,
                          fontFamily: "cairo",
                          fontSize: 14.sp),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    )),
                10.verticalSpace,
                TextField(
                    readOnly: true,
                    style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: seance.dateStart.toString(),
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                      suffixIcon: const Icon(
                        Icons.start_sharp,
                        color: gray,
                      ),
                      focusColor: PrimaryColor,
                      labelStyle: TextStyle(
                          color: gray,
                          fontWeight: FontWeight.bold,
                          fontFamily: "cairo",
                          fontSize: 14.sp),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    )),
                10.verticalSpace,
                TextField(
                    readOnly: true,
                    style: TextStyle(color: Colors.black ,fontFamily: 'cairo',fontSize: 14.sp, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: '${seance.car?.brand} (${seance.car?.color})',
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                      suffixIcon: const Icon(
                        Icons.time_to_leave_rounded,
                        color: gray,
                      ),
                      focusColor: PrimaryColor,
                      labelStyle: TextStyle(
                          color: gray,
                          fontWeight: FontWeight.bold,
                          fontFamily: "cairo",
                          fontSize: 14.sp),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    )),
                20.verticalSpace,
                GetBuilder<SchoolSeanceDetailController>(
                  init: SchoolSeanceDetailController(),
                  builder:(controller)=> GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6.0,
                      mainAxisSpacing: 5.0,
                      mainAxisExtent: 139,
                    ),
                    itemCount: controller.candidats.length,
                    itemBuilder: (BuildContext context, int index) {
                      final candidat = controller.candidats[index] ;
                      // controller.update();
                      return InkWell(
                        onTap: (){
                          Get.to(SchoolCandidatDetail() , arguments: [candidat]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.sp),
                                child: SizedBox(
                                  height: 50.h,
                                  width: 50.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(90.r)),
                                    child: CachedNetworkImage(
                                      imageUrl: '$canpict/${candidat.photo}',
                                      width: 50.w,
                                      height: 50.w,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Container(
                                  margin: EdgeInsets.only(top: 10.sp),
                                  child: Center(child: Text('${candidat.name!.split(' ')[0]} ...'))
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                12.verticalSpace,
                ElevatedButton(
                  child: Text('delete').tr(),
                    onPressed:   () {
                    DeletePopup(context, StringTranslateExtension('deleteaccount').tr(), seance.id!, 'seance', const SchoolHomeScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
