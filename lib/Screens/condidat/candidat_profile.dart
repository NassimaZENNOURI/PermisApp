
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';

import '../../Components/appVars.dart';
import '../../controllers/candidat/candidat_profile_controller.dart';

class CandidatProfile extends StatelessWidget {
  const CandidatProfile({Key? key}) : super(key: key);

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
                  height: 47.h,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            21.verticalSpace,
            Center(
              child: Column(
                children: [
                  GetBuilder<CandidatProfileController>(
                    init: CandidatProfileController(),
                    builder: (controller) => ClipRRect(
                        borderRadius:
                        BorderRadius.all(Radius.circular(90.r)),
                        child: controller.candidat.photo == '' ? null : CachedNetworkImage(
                          progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          imageUrl: '$canpict/${controller.candidat.photo}',
                          width: 100.w,
                          height: 100.w,
                          fit: BoxFit.cover,
                        )),
                  ),
                  10.verticalSpace,
                  GetBuilder<CandidatProfileController>(
                    builder:(controller) => Text(
                      controller.candidat.name.toString(),
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  GetBuilder<CandidatProfileController>(
                    builder:(controller) =>  Text(
                      controller.candidat.schoolName.toString(),
                      style: TextStyle(
                        color: gray,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  20.verticalSpace,
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
                            GetBuilder<CandidatProfileController>(
                              builder:(controller) =>  TextField(
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
                            GetBuilder<CandidatProfileController>(
                              builder:(controller) =>  TextField(
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
                            GetBuilder<CandidatProfileController>(
                              builder:(controller) =>  TextField(
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
                            GetBuilder<CandidatProfileController>(
                              builder:(controller) =>  TextField(
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
                            GetBuilder<CandidatProfileController>(
                              builder:(controller) =>  TextField(
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
