import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Components/appVars.dart';
import '../../controllers/school/school_candidat_edit_controller.dart';

class SchoolCandidatEdit extends StatelessWidget {
  const SchoolCandidatEdit({super.key});

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
      body: GetBuilder<SchoolCandidatEditController>(
        init: SchoolCandidatEditController(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              21.verticalSpace,
              Center(
                child: Column(
                  children: [
                    GetBuilder<SchoolCandidatEditController>(
                      init: SchoolCandidatEditController(),
                      builder:(controller) => ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(90.r)),
                          child: CachedNetworkImage(
                            width: 100.w,
                            height: 100.w,
                            fit: BoxFit.cover,
                            imageUrl: '$canpict/${controller.candidat.photo}',
                          )),
                    ),
                    10.verticalSpace,
                    GetBuilder<SchoolCandidatEditController>(
                      builder:(controller) => Text(
                        controller.candidat.name.toString(),
                        style: TextStyle(
                          color: Dark,
                          fontFamily: 'cairo',
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    GetBuilder<SchoolCandidatEditController>(
                      builder:(controller) => Text(
                        controller.candidat.email.toString(),
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text('fullname', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold , ),).tr(),
                                const Text(':', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatEditController>(
                              builder: (controller) => TextField(
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.person,
                                      color: PrimaryColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                ),
                                controller: controller.nameController,
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('email', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold , ),).tr(),
                                const Text(':', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatEditController>(
                              builder: (controller) => TextField(

                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.email,
                                      color: PrimaryColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                ),
                                controller: controller.emailController,
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('datenaiss', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold ,),).tr(),
                                const Text(':', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatEditController>(
                              builder: (controller) => TextField(
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.date_range, color: PrimaryColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: PrimaryColor)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                ),
                                controller: controller.dateController,
                                onTap: () async {
                                  DateTime? date = DateTime(1900);
                                  FocusScope.of(context).requestFocus(FocusNode());
                                  date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  var formate2 = "${date?.day}-${date?.month}-${date?.year}";
                                  controller.dateController.text = formate2;
                                },
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('Genre', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold , ),).tr(),
                                const Text(':', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatEditController>(
                              builder: (controller) => TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: controller.candidat.sexe.toString() == '1' ? 'Homme' : 'Femme',
                                  suffixIcon: const Icon(Icons.person,
                                      color: PrimaryColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                ),
                                //controller: controller.genreController ,
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('cin', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold , ),).tr(),
                                const Text(':', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatEditController>(
                              builder: (controller) => TextField(
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.numbers,
                                      color: PrimaryColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                ),
                                controller: controller.cinController,
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Text('telephone', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold , ),).tr(),
                                const Text(':', style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            GetBuilder<SchoolCandidatEditController>(
                              builder: (controller) => TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.phone,
                                      color: PrimaryColor),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          color: PrimaryColor)),
                                ),
                                controller: controller.phoneController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    25.verticalSpace,
                    GetBuilder<SchoolCandidatEditController>(
                      builder: (controller) => ElevatedButton(
                        onPressed: () {
                          controller.editCandidat(controller.candidat);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: PrimaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'modifier',
                            style:
                                TextStyle(fontSize: 18.sp, color: Colors.white),
                          ).tr(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
