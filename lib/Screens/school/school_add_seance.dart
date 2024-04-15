import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import '../../Components/appVars.dart';
import '../../apiFunctions/Functions.dart';
import '../../controllers/school/school_add_seance_controller.dart';

class SchoolAddSeance extends StatelessWidget {
  const SchoolAddSeance({Key? key}) : super(key: key);

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
            Get.back();
          },
          child: Icon(
            !isar
                ? IconlyBroken.arrow_left_2
                : IconlyBroken.arrow_right_2,
            size: 30.h,
          ),
        ),
        flexibleSpace: Container(
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [firstGrad, secondGrad],
              stops: [0.5, 1.0],
            ),
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
        backgroundColor: PrimaryColor,
        toolbarHeight: 80.h,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            17.verticalSpace,
            17.verticalSpace,
            Text(
              "Addseance",
              style: TextStyle(
                  color: Dark,
                  fontFamily: 'cairo',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ).tr(),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w , vertical: 12.h),
              child: Column(
                children: [
                  10.verticalSpace,
                  Row(
                    children: [
                      const Text('candidatname', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                      const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  GetBuilder<SchoolAddSeanceController>(
                    init: SchoolAddSeanceController(),
                    builder:(controller)=> SizedBox(
                        width: 338.w,
                        height: controller.selectedCandidat.isEmpty ? 65.h : controller.selectedCandidat.length * 30 + 140.h,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(12.r)),
                              border: Border.all(color: Gry3, )),
                          child: MultiSelectDialogField(
                            buttonIcon: const Icon(IconlyBroken.arrow_down_2),
                            buttonText: Text(
                              'chosecandidat',
                              style: TextStyle(
                                  color: Dark,
                                  fontFamily: 'cairo',
                                  fontSize: 15.sp),
                              // textAlign: TextAlign.center,
                            ).tr(),
                            searchable: true,
                            items: controller.candidats.map((e) => MultiSelectItem(e.id, e.name!)).toList(),
                            listType: MultiSelectListType.LIST,
                            onConfirm: (value){
                              controller.selectedCandidat = value  ;
                              controller.update();
                            },
                          ),
                        )),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Text('coachname', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                      const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(
                    width: 338.w,
                    height: 65.h,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.all(Radius.circular(12.r)),
                            border:
                            Border.all(color: Gry3, width: 1.9.w)),
                        child: GetBuilder<SchoolAddSeanceController>(
                          init: SchoolAddSeanceController(),
                          builder:(controller)=> DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Padding(
                                padding:
                                EdgeInsets.symmetric(horizontal: 13.w),
                                child: Icon(
                                  IconlyBroken.arrow_down_2,
                                  color: Dark,
                                  size: 26.sp,
                                ),
                              ),
                              value: controller.selectedCoach,
                              items: controller.coachs.map((e) {
                                return DropdownMenuItem(
                                  value: e.id ,
                                  child:  Padding(padding:EdgeInsets.only(left: 10.w),
                                      child: Text(e.name!, style: TextStyle(fontSize: 14.sp ,fontWeight: FontWeight.bold),)
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                controller.selectedCoach = value!;
                                controller.coachController.text = "$value" ;
                                controller.update();
                              },
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'cairo',
                                  fontSize: 16),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                            ),
                          ),
                        )),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Text('schoolname1', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                      const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(
                    width: 339.w,
                    height: 65.h,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            border: Border.all(color: Gry3, width: 1.9.w)),
                        child: GetBuilder<SchoolAddSeanceController>(
                          init: SchoolAddSeanceController(),
                          builder:(controller)=> DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 13.w),
                                child: Icon(
                                  IconlyBroken.arrow_down_2,
                                  color: Dark,
                                  size: 26.sp,
                                ),
                              ),
                              value: controller.selectedCar,
                              items: controller.cars.map((e) {
                                return DropdownMenuItem(
                                  value: e.id ,
                                    child:  Padding(padding:EdgeInsets.only(left: 10.w),
                                        child: Text('${e.brand} (${e.matricule})', style: TextStyle(fontSize: 14.sp ,fontWeight: FontWeight.bold),)
                                    ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                controller.selectedCar = value!;
                                controller.carController.text = "$value" ;
                                controller.update();
                              },
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'cairo',
                                  fontSize: 16),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                            ),
                          ),
                        )),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Text('period', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                      const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(
                    width: 339.w,
                    height: 65.h,
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            border: Border.all(color: Gry3, width: 1.9.w)),
                        child: GetBuilder<SchoolAddSeanceController>(
                          init: SchoolAddSeanceController(),
                          builder:(controller)=> DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 13.w),
                                child: Icon(
                                  IconlyBroken.arrow_down_2,
                                  color: Dark,
                                  size: 26.sp,
                                ),
                              ),
                              items: controller.period.map((e) {
                                return DropdownMenuItem(
                                  value: e.periodId,
                                  child: Padding(padding:EdgeInsets.only(left: 10.w, right: 50.w),
                                      child: Text('${e.text}', style: TextStyle(fontSize: 14.sp ,fontWeight: FontWeight.bold),)
                                  ),
                                );
                              }).toList(),
                              value: controller.selectedperiod,
                              onChanged: (newvalue){
                                controller.selectedperiod = newvalue! ;
                                controller.periodController.text = "$newvalue" ;
                                controller.update();
                              },
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'cairo',
                                  fontSize: 16),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                            ),
                          ),
                        )),
                  ),
                  10.verticalSpace,
                  Row(
                    children: [
                      const Text('startdate', style: TextStyle(color: gray,fontWeight: FontWeight.bold),).tr(),
                      const Text(':', style: TextStyle(color: gray,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  GetBuilder<SchoolAddSeanceController>(
                    init: SchoolAddSeanceController(),
                    builder:(controller) => TextFormField(
                      controller: controller.startdateController,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: tr('date'),
                        contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 19),
                        hintStyle: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'cairo',
                            color: Dark),
                        suffixIcon:
                        const Icon(IconlyBroken.calendar, color: Dark),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0.r),
                          borderSide: const BorderSide(
                            color: Gry3,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0.r),
                          borderSide: const BorderSide(
                            color: Gry3,
                            width: 1.9,
                          ),
                        ),
                      ),
                      onTap: () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());
                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100)
                        );
                        controller.startdateController.text = date.toString().split(' ').first;
                      },
                    ),
                  ),
                  10.verticalSpace,
                ],
              ),
            ),
            90.verticalSpace,
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 220.w,
        height: 55.h,
        child: GetBuilder<SchoolAddSeanceController>(
          init: SchoolAddSeanceController(),
          builder:(controller)=> FloatingActionButton.extended(
            backgroundColor: PrimaryColor,
            onPressed: () async {
              controller.addSeance();
            },
            label: Text(
              "continue",
              style: TextStyle(fontSize: 16.sp, fontFamily: "cairo"),
            ).tr(),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}
