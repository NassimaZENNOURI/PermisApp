import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/school/school_home_screen.dart';
import '../../Components/appVars.dart';
import '../../components/functions.dart';
import '../../controllers/school/school_car_detail_controller.dart';

class SchoolCarDetail extends StatelessWidget {
  const SchoolCarDetail({super.key});


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
                  GetBuilder<SchoolCarDetailController>(
                    init: SchoolCarDetailController(),
                    builder:(controller)=> ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(3456789.r)),
                        child: CachedNetworkImage(
                          width: 100.w,
                          height: 100.w,
                          fit: BoxFit.cover,
                          imageUrl: '$car/${controller.car.photo}',
                          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(value: downloadProgress.progress),),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        )),
                  ),
                  10.verticalSpace,
                  GetBuilder<SchoolCarDetailController>(
                    builder:(controller)=>  Text(
                      controller.car.brand.toString(),
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text('brand', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                              const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          GetBuilder<SchoolCarDetailController>(
                            builder:(controller)=>  TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: controller.car.brand,
                                suffixIcon: const Icon(Icons.time_to_leave_outlined, color: Gry3),
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
                              const Text('color', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                              const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          GetBuilder<SchoolCarDetailController>(
                            builder:(controller)=>  TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: controller.car.color,
                                suffixIcon: const Icon(Icons.color_lens, color: Gry3),
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
                              const Text('createdat', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                              const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          GetBuilder<SchoolCarDetailController>(
                            builder:(controller)=>  TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: controller.car.createdAt!.split(':')[0],
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
                              const Text('matricule', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                              const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          GetBuilder<SchoolCarDetailController>(
                            builder:(controller)=>  TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: controller.car.matricule,
                                suffixIcon: const Icon(Icons.numbers, color: Gry3),
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
                              const Text('version', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                              const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          GetBuilder<SchoolCarDetailController>(
                            builder:(controller)=>  TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: controller.car.version,
                                suffixIcon: const Icon(Icons.time_to_leave, color: Gry3),
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
                              const Text('engine', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                              const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          GetBuilder<SchoolCarDetailController>(
                            builder:(controller)=>  TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: controller.car.engine,
                                suffixIcon: const Icon(Icons.time_to_leave, color: Gry3),
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
                              const Text('kilometrage', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                              const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          GetBuilder<SchoolCarDetailController>(
                            builder:(controller)=>  TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: controller.car.kilometrage,
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
                  20.verticalSpace,
                  GetBuilder<SchoolCarDetailController>(
                    builder:(controller)=>  ElevatedButton(
                      child: const Text('delete').tr(),
                      onPressed: () {
                        DeleteCarPopup(context, 'accountdelete'.tr(), controller.car.id!, SchoolHomeScreen(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            90.verticalSpace,
          ],
        ),
      ),
    );
  }
}
