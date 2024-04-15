import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Components/appVars.dart';
import '../../controllers/school/school_candidat_detail_controller.dart';

class SchoolCandidatDetail extends StatelessWidget {
  const SchoolCandidatDetail({super.key});

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
                  GetBuilder<SchoolCandidatDetailController>(
                    init: SchoolCandidatDetailController(),
                    builder:(controller)=> ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                        child: CachedNetworkImage(
                          width: 100.w,
                          height: 100.w,
                          fit: BoxFit.cover,
                          imageUrl: '$canpict/${controller.candidat.photo}',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        )),
                  ),
                  10.verticalSpace,
                  GetBuilder<SchoolCandidatDetailController>(
                    builder:(controller)=> Text(
                      controller.candidat.name.toString(),
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  GetBuilder<SchoolCandidatDetailController>(
                    builder:(controller)=>  Text(
                      controller.candidat.email.toString() == "null" ? '': controller.candidat.email.toString(),
                      style: TextStyle(
                        color: gray,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                    child: Row(
                      children: [
                        Container(
                          height: 100.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Gry3, width: 1.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.r))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Text(
                                'paid',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'cairo',
                                  color: Dark,
                                ),
                              ).tr(),
                              const Spacer(),
                              GetBuilder<SchoolCandidatDetailController>(
                                builder:(controller)=> Text(
                                  '${controller.candidat.paid} Dh',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        15.horizontalSpace,
                        Container(
                          height: 100.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Gry3, width: 1.2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.r))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Text(
                                'reste',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'cairo',
                                  color: Dark,
                                ),
                              ).tr(),
                              const Spacer(),
                              GetBuilder<SchoolCandidatDetailController>(
                                builder:(controller)=>  Text(
                                  '${controller.reste} Dh',
                                  style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.verticalSpace,
                  Container(
                    width: 320.w,
                    height: 95.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Gry3, width: 1.2),
                        borderRadius: BorderRadius.all(Radius.circular(12.r))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 21.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'tarifs',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'cairo',
                              color: Dark,
                            ),
                          ).tr(),
                          9.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GetBuilder<SchoolCandidatDetailController>(
                                builder:(controller)=>  Text(
                                  '${controller.candidat.tarifs} Dh',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  GetBuilder<SchoolCandidatDetailController>(
                    builder:(controller) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text('fullname', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatDetailController>(
                              builder:(controller)=>  TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: controller.candidat.name,
                                  suffixIcon: const Icon(Icons.person, color: Gry3),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Gry3),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              ),
                            ),
                            // 10.verticalSpace,
                            // Column(
                            //   children: [
                            //     Row(
                            //       children: [
                            //         const Text('email', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                            //         const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                            //       ],
                            //     ),
                            //     GetBuilder<SchoolCandidatDetailController>(
                            //       builder:(controller)=>  TextField(
                            //         readOnly: true,
                            //         decoration: InputDecoration(
                            //           hintText: controller.candidat.email,
                            //           suffixIcon: const Icon(Icons.email, color: Gry3),
                            //           border: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(12.r),
                            //               borderSide: const BorderSide(color: Gry3)),
                            //           focusedBorder: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(12.r),
                            //               borderSide: const BorderSide(color: Gry3)),
                            //           enabledBorder: OutlineInputBorder(
                            //             borderSide: const BorderSide(color: Gry3),
                            //             borderRadius: BorderRadius.circular(12.r),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ) ,
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('datenaiss', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatDetailController>(
                              builder:(controller)=>  TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: controller.candidat.birthdate,
                                  suffixIcon:
                                      const Icon(Icons.date_range, color: Gry3),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Gry3),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('Genre', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatDetailController>(
                              builder:(controller)=>  TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: controller.candidat.sexe.toString() == '1'
                                      ? 'Homme'
                                      : 'Femme',
                                  suffixIcon: const Icon(Icons.person, color: Gry3),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Gry3),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('cin', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatDetailController>(
                              builder:(controller)=>  TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: controller.candidat.cni,
                                  suffixIcon:
                                      const Icon(Icons.numbers, color: Gry3),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Gry3),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('telephone', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                                const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatDetailController>(
                              builder:(controller)=>  TextField(
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: controller.candidat.phoneNo,
                                  suffixIcon: const Icon(Icons.phone, color: Gry3),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                      borderSide: const BorderSide(color: Gry3)),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Gry3),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
