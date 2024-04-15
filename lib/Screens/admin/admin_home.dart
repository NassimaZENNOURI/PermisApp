import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:permisapp/Screens/admin/inscription_list.dart';
import 'package:permisapp/Screens/admin/school_list.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/admin_length_controller.dart';
import 'candidat_list.dart';
import 'facture_list.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isar = true;
    String curr = Localizations.localeOf(context).toString();
    if (curr == 'ar') {
      isar = true;
    } else {
      isar = false;
    }
    return
    SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(8.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: const Offset(12.0, 6.0),
                              blurRadius: 25.0,
                              spreadRadius: 3.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Stack(
                          children: [
                            Container(
                                child: Image.asset('assets/images/adminHome.png',fit: BoxFit.cover, ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                35.verticalSpace,
                                 Text("bnv", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17, color: Dark.withOpacity(0.7)),).tr(),
                                 Text("bnt", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17, color: Dark.withOpacity(0.7)),).tr(),

                              ],
                            )
                            ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap : (){
                          Get.to(const InscriptionList());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: PrimaryColor, width: 1.2.w),
                              borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          ),
                          width: 150.w,
                          height: 160.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Icon(
                                IconlyBroken.send,
                                size: 50.sp,
                                color: SecondaryColor,
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GetBuilder<AdminLengthController>(
                                    init: AdminLengthController(),
                                    builder:(controller) => Text(
                                      controller.InscriptionsLength.toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Dark),
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Text(
                                    "demandinsc",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                      color: Dark,
                                    ),
                                  ).tr(),
                                ],
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                      14.horizontalSpace,
                      GetBuilder<AdminLengthController>(
                        init: AdminLengthController(),
                        builder: (controller) => InkWell(
                          onTap: () {
                            Get.to(SchoolList());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: PrimaryColor, width: 1.2.w),
                                borderRadius:
                                BorderRadius.all(Radius.circular(12.r))
                            ),
                            width: 150.w,
                            height: 160.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                20.verticalSpace,
                                Icon(
                                  IconlyBroken.bookmark,
                                  size: 50.sp,
                                  color: SecondaryColor,
                                ),
                                20.verticalSpace,
                                Text(
                                    controller.schoolLength.toString(),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: Dark
                                    )
                                ),
                                7.verticalSpace,
                                Text(
                                  "schools",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                ).tr(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  GetBuilder<AdminLengthController>(
                    init: AdminLengthController(),
                    builder : (controller) => InkWell(
                      onTap: () {
                        Get.to(CandidatsList());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: PrimaryColor, width: 1.2.w),
                            borderRadius:
                            BorderRadius.all(Radius.circular(12.r))),
                        width: 335.w,
                        height: 93.h,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                13.verticalSpace,
                                Row(
                                  children: [
                                    23.horizontalSpace,
                                    Icon(
                                      IconlyBroken.user_3,
                                      size: 28.sp,
                                      color: SecondaryColor,
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      "candidats",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: SecondaryColor,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                const Spacer(),
                                GetBuilder<AdminLengthController>(
                                  init: AdminLengthController(),
                                  builder :  (controller)  => Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 29.0.w),
                                    child: Row(
                                      children: [
                                        Text(
                                            controller.candidatLength.toString(),
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'cairo',
                                                color: Dark
                                            )
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w
                                          ),
                                          child: Text(
                                            "candidats",
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo',
                                              color: Dark,
                                            ),
                                          ).tr(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17.w),
                              child: Icon(
                                isar
                                    ? IconlyBroken.arrow_left_2 :
                                IconlyBroken.arrow_right_2,
                                color: SecondaryColor,
                                size: 29.sp,

                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 14.verticalSpace,
                  // GetBuilder<AdminLengthController>(
                  //   builder: (controller) => InkWell(
                  //     onTap: () {
                  //       Get.to(SchoolList());
                  //     },
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           border: Border.all(color: Gry3, width: 1.2.w),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(12.r))),
                  //       width: 335.w,
                  //       height: 93.h,
                  //       child: Row(
                  //         children: [
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               13.verticalSpace,
                  //               Row(
                  //                 children: [
                  //                   23.horizontalSpace,
                  //                   Icon(
                  //                     IconlyBroken.bookmark,
                  //                     size: 28.sp,
                  //                   ),
                  //                   5.horizontalSpace,
                  //                   Text(
                  //                     "schools",
                  //                     style: TextStyle(
                  //                       fontSize: 14.sp,
                  //                       fontFamily: 'cairo',
                  //                       color: Dark,
                  //                     ),
                  //                   ).tr(),
                  //                 ],
                  //               ),
                  //               const Spacer(),
                  //               Padding(
                  //                 padding:
                  //                 EdgeInsets.symmetric(horizontal: 25.w),
                  //                 child: Row(
                  //                   children: [
                  //                     Text(
                  //                         controller.schoolLength.toString(),
                  //                         style: TextStyle(
                  //                             fontSize: 14.sp,
                  //                             fontFamily: 'cairo',
                  //                             color: Dark)),
                  //                     5.horizontalSpace,
                  //                     Text(
                  //                       "schools",
                  //                       style: TextStyle(
                  //                         fontSize: 14.sp,
                  //                         fontFamily: 'cairo',
                  //                         color: Dark,
                  //                       ),
                  //                     ).tr(),
                  //                   ],
                  //                 ),
                  //               ),
                  //               const Spacer(),
                  //             ],
                  //           ),
                  //           const Spacer(),
                  //           Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 17.w),
                  //             child: Icon(
                  //               isar
                  //                   ? IconlyBroken.arrow_left_2 :
                  //               IconlyBroken.arrow_right_2,
                  //               color: PrimaryColor,
                  //               size: 29.sp,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  14.verticalSpace,
                  GetBuilder<AdminLengthController>(
                    builder: (controller) => InkWell(
                      onTap: () {
                        Get.to(facturalList());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: PrimaryColor, width: 1.2.w),
                            borderRadius:
                            BorderRadius.all(Radius.circular(12.r))
                        ),
                        width: 335.w,
                        height: 93.h,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                13.verticalSpace,
                                Row(
                                  children: [
                                    23.horizontalSpace,
                                    Icon(
                                      IconlyBroken.graph,
                                      size: 28.sp,
                                      color: SecondaryColor,
                                    ),
                                    5.horizontalSpace,
                                    Text(
                                      "state",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'cairo',
                                        color: SecondaryColor,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Row(
                                    children: [
                                      Text(
                                          controller.factureLength.toString(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontFamily: 'cairo',
                                              color: Dark)
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        "factures",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Dark,
                                        ),
                                      ).tr(),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 17.w),
                              child: Icon(
                                isar
                                    ? IconlyBroken.arrow_left_2 :
                                IconlyBroken.arrow_right_2,
                                color: SecondaryColor,
                                size: 29.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  18.verticalSpace,
                ],
              ),
            ),
            90.verticalSpace,
          ],
        )
    );
  }
}
