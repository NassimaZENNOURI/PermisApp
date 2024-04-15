import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/admin_candidat_detail_controller.dart';


class DetailCandidat extends StatelessWidget {
  const DetailCandidat({super.key});

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
                  GetBuilder<AdminCandidatDetailController>(
                    init: AdminCandidatDetailController(),
                    builder:(controller)=> ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(90.r)),
                        child: CachedNetworkImage(
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                          imageUrl: '$canpict/${controller.candidat.photo}',
                          progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
                          errorWidget: (context, url, error) => Icon(Icons.error),

                        )),
                  ),
                  10.verticalSpace,
                  GetBuilder<AdminCandidatDetailController>(
                    builder:(controller)=>  Text(
                      controller.candidat.name.toString(),
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  GetBuilder<AdminCandidatDetailController>(
                    builder:(controller)=>  Text(
                      controller.candidat.email.toString() == 'null' ? '' : controller.candidat.email.toString(),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 100.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Gry3, width: 1.2),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.r))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Center(
                                    child: Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 30.w),
                                      child: Text(
                                        'tarifs',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                          color: Dark,
                                        ),
                                      ).tr(),
                                    ),
                                  ),
                                  const Spacer(),
                                  GetBuilder<AdminCandidatDetailController>(
                                    builder:(controller)=>  Text(
                                      '${controller.candidat.tarifs} Dh',
                                      style: TextStyle(
                                        fontSize: 20.sp,
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.r))),
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
                                  GetBuilder<AdminCandidatDetailController>(
                                    builder:(controller)=>  Text(
                                      '${controller.candidat.paid} Dh',
                                      style: TextStyle(
                                        fontSize: 20.sp,
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
                        10.verticalSpace,
                        Container(
                          width: 316.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Gry3, width: 1.2),
                              borderRadius:
                              BorderRadius.all(Radius.circular(12.r))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 19.w , vertical: 12.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'money',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    color: Dark,
                                  ),
                                ).tr(),
                                9.verticalSpace,
                                GetBuilder<AdminCandidatDetailController>(
                                  builder:(controller)=>  Text(
                                    '${controller.reste} Dh',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                      color: Dark,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Gry3, width: 1.2),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12.r))
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.verticalSpace,
                            const Text('schoolname', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCandidatDetailController>(
                              init: AdminCandidatDetailController(),
                              builder:(controller)=>  TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.candidat.schoolName}',
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 1.h,
                              color: Gry3,
                            ),
                            20.verticalSpace,
                            const Text('datenaiss', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCandidatDetailController>(
                              builder:(controller)=>  TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.candidat.birthdate}',
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 1.h,
                              color: Gry3,
                            ),
                            20.verticalSpace,
                            const Text('Genre', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCandidatDetailController>(
                              builder:(controller)=>  TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.candidat.sexe.toString()=="1"?'Homme'.tr():'Femme'.tr()}',
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 1.h,
                              color: Gry3,
                            ),
                            20.verticalSpace,
                            const Text('cin', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCandidatDetailController>(
                              builder:(controller)=> TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.candidat.cni}',
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 1.h,
                              color: Gry3,
                            ),
                            20.verticalSpace,
                            const Text('telephone', style: TextStyle(color: Colors.black , ),).tr(),
                            GetBuilder<AdminCandidatDetailController>(
                              builder:(controller)=> TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: '  ${controller.candidat.phoneNo}',
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                  labelStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace,
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
