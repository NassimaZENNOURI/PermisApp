import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/coach/coatch_seance_profile.dart';
import 'package:permisapp/components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/coatch/coatch_seance_list_controller.dart';
import 'coach_drawer_navigator.dart';

class CoatchSeanceList extends StatelessWidget {
  const CoatchSeanceList({Key? key}) : super(key: key);

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
      drawer: const CoatchDrawerNavigator(),
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
      backgroundColor: PrimaryBg,
      body: GetBuilder<CoatchSeanceListController>(
        init: CoatchSeanceListController(),
        builder:(controller)=> controller.isLoading.value ? const Loading(): SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.verticalSpace,
                Text(
                  'seances',
                  style: TextStyle(
                    color: Dark,
                    fontFamily: 'cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ).tr(),
                5.verticalSpace,
                15.verticalSpace,
                controller.seances.isEmpty ?
                Center(
                    child: Text(
                      'noseance',
                      style: TextStyle(color: Dark, fontSize: 20.sp),
                    ).tr()
                ):
                GetBuilder<CoatchSeanceListController>(
                  init: CoatchSeanceListController(),
                  builder:(controller)=> GridView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: controller.seances.length,
                    itemBuilder: (context, index) {
                      final seance = controller.seances[index] ;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.to(
                                CoatchSeanceProfile() , arguments: [controller.seances[index].id]
                            );
                          },
                          child: SizedBox(
                            width: 160.w,
                            height: 145.h,
                            child: Container(
                                height: 79.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                    Border.all(color: Gry3, width: 1.2.w),
                                    borderRadius: BorderRadius.all(Radius.circular(12.r))),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    SizedBox(
                                      width: 60,
                                      child: AspectRatio(
                                        aspectRatio: 60 / 60,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(70.r)),
                                          child: Image.asset(
                                            'assets/images/seance.png',
                                            fit: BoxFit.cover,
                                            width: 75.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      seance.dateStart.toString(),
                                      style: TextStyle(
                                        color: Dark,
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'de',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo',
                                            color: Gry3,
                                          ),
                                        ).tr(),
                                        5.horizontalSpace,
                                        Text(seance.text!.split('-')[0],
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo',
                                              color: Gry3,
                                            )),
                                        5.horizontalSpace,
                                        Text(
                                          'vers',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: 'cairo',
                                            color: Gry3,
                                          ),
                                        ).tr(),
                                        5.horizontalSpace,
                                        Text(
                                            seance.text!.split('-')[1],
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo',
                                              color: Gry3,
                                            )),
                                      ],
                                    ),
                                    const Spacer(),
                                  ],
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
