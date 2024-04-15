import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/components/widgets.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/admin_inscription_detail_controller.dart';

class DetailInscription extends StatelessWidget {
  const DetailInscription({super.key});


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
                  SizedBox(
                    height:20.h ,
                    child: const Text('detailsinscrp', style: TextStyle(color: PrimaryColor ,fontFamily: 'cairo', fontSize: 16, fontWeight: FontWeight.bold),).tr(),
                  ),
                  30.verticalSpace,
                  GetBuilder<AdminInscriptionDetailController>(
                    init: AdminInscriptionDetailController(),
                    builder:(controller)=> Text(
                      controller.school.school_name.toString(),
                      style: TextStyle(
                        color: Dark,
                        fontFamily: 'cairo',
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  GetBuilder<AdminInscriptionDetailController>(
                    builder:(controller)=>Text(
                      controller.school.name.toString(),
                      style: TextStyle(
                        color: gray,
                        fontFamily: 'cairo',
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Container(
                    width: 220.w,
                    height: 0.5.h,
                    color: Colors.black,
                  ),
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      children: [
                        GetBuilder<AdminInscriptionDetailController>(
                          builder:(controller)=> PrimaryTextField(
                            hintText: controller.school.school_name.toString(),
                            centered: false,
                            visibility: false,
                            prefixIcon: const Icon(Icons.perm_identity) ,
                          ),
                        ),
                        20.verticalSpace,
                        GetBuilder<AdminInscriptionDetailController>(
                          builder:(controller)=> PrimaryTextField(
                            hintText: controller.data.email.toString(),
                            centered: false,
                            visibility: false,
                            prefixIcon: const Icon(Icons.email) ,
                          ),
                        ),
                        20.verticalSpace,
                        GetBuilder<AdminInscriptionDetailController>(
                          builder:(controller)=> PrimaryTextField(
                            hintText: controller.data.phoneNo.toString(),
                            centered: false,
                            visibility: false,
                            prefixIcon: const Icon(Icons.phone) ,
                          ),
                        ),
                        20.verticalSpace,
                        GetBuilder<AdminInscriptionDetailController>(
                          builder:(controller)=> PrimaryTextField(
                            hintText: controller.data.address.toString(),
                            centered: false,
                            visibility: false,
                            prefixIcon: const Icon(Icons.home_work_outlined) ,
                          ),
                        ),
                        20.verticalSpace,
                        GetBuilder<AdminInscriptionDetailController>(
                          builder:(controller)=> PrimaryTextField(
                            hintText: controller.data.city.toString(),
                            centered: false,
                            visibility: false,
                            prefixIcon: const Icon(Icons.location_city) ,
                          ),
                        ),
                        20.verticalSpace,
                        GetBuilder<AdminInscriptionDetailController>(
                          builder:(controller)=>PrimaryTextField(
                            hintText: controller.data.status == '1' ? 'actif'.tr() : 'inactif'.tr() ,
                            centered: false,
                            visibility: false,
                            prefixIcon: const Icon(Icons.person_pin_outlined),
                          ),
                        ),
                        20.verticalSpace,
                      ],
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
