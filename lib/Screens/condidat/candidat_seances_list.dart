import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/candidat/candidat_seance_controller.dart';

class CandidatSeancesList extends StatelessWidget {
  const CandidatSeancesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<CandidatSeancesListController>(
        init: CandidatSeancesListController(),
        builder:(controller)=>controller.isloading.value ? const Loading() : Padding(
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
              GetBuilder<CandidatSeancesListController>(
                init: CandidatSeancesListController(),
                builder:(controller)=> GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: controller.seances.length,
                  itemBuilder: (context, index) {
                    final seance = controller.seances[index];
                    return GestureDetector(
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
                                    border: Border.all(color: Gry3, width: 1.2.w),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(12.r))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                          child: CachedNetworkImage(progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                    );
                  },
                ),
              ),
              90.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
