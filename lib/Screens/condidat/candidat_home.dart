import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../Components/appVars.dart';
import '../../controllers/candidat/candidat_home_controller.dart';


class CandidatHome extends StatelessWidget {
  const CandidatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        30.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 0,
              color: PrimaryColor,
              child: Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'cairo',
                              fontWeight: FontWeight.bold),
                        ).tr(),
                        5.horizontalSpace,
                        GetBuilder<CandidatHomeController>(
                          init: CandidatHomeController(),
                          builder:(controller)=> Text(
                            controller.candidat.name.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "welcome1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.sp,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.bold),
                    ).tr(),
                  ],
                ),
              ),
            ),
          ),
        ),

        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CandidatHomeController>(
              builder:(controller)=> StatefulBuilder(builder: (context, setState) {
                return Text(
                  "${controller.timeOfDay.hour}:${controller.timeOfDay.minute < 10 ? '0${controller.timeOfDay.minute}' : controller.timeOfDay.minute}",
                  style: TextStyle(
                      fontSize: 67.sp, fontFamily: 'cairo', color: Dark),
                );}
              ),
            ),
            10.horizontalSpace,
            RotatedBox(
              quarterTurns: 3,
              child: GetBuilder<CandidatHomeController>(
                builder:(controller)=> Text(
                    controller.periodDay == 'DayPeriod.am'
                        ? StringTranslateExtension("après-midi").tr()
                        : StringTranslateExtension("matin").tr(),
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'cairo',
                        color: Dark
                    )
                ).tr(),
              ),
            ),
          ],
        ),

        20.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Text(
            'appointment',
            style: TextStyle(
                color: Dark,
                fontSize: 16.sp,
                fontFamily: 'cairo',
                fontWeight: FontWeight.bold),
          ).tr(),
        ),

        10.verticalSpace,
        SizedBox(
          height: 200.h,
          width: 375.h,
          child: GetBuilder<CandidatHomeController>(
            init: CandidatHomeController(),
            builder: (controller)=> ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.seances.length,
              itemBuilder: (BuildContext context, int index) {
                final seance = controller.seances[index];
                return Row(
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {

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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.r))),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(70.r)),
                                          child: CachedNetworkImage(
                                            progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                                            errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                            imageUrl: '$mopict/${seance.photo}',
                                            fit: BoxFit.cover,
                                            width: 75.w,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${seance.moniteurName}',
                                      style: TextStyle(
                                        color: Dark,
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${seance.dateStart}',
                                      style: TextStyle(
                                        color: Gry3,
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
                                        Text(
                                            "${seance.text!.split('-')[0]}:00",
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
                                            '${seance.text!.split('-')[1]}:00',
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
                      ),
                    ),
                  ],
                );
              },

            ),
          ),
        ),
        20.verticalSpace,
        90.verticalSpace,
      ],
    );
  }
}

