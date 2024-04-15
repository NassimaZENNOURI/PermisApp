import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Components/functions.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/admin_facture_detail_controller.dart';
import 'admin_home_screen.dart';

class DetailFacture extends StatelessWidget {
  const DetailFacture({super.key});

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
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:12.0.w),
            child: Column(
              children: [
                17.verticalSpace,
                17.verticalSpace,
                Text(
                  "facturedetail",
                  style: TextStyle(
                      color: PrimaryColor,
                      fontFamily: 'cairo',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ).tr(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        20.verticalSpace,
                        const Text('candidatemail', style: TextStyle(color: Colors.black , ),).tr(),
                        GetBuilder<AdminFactureDetailController>(
                          init: AdminFactureDetailController(),
                          builder:(controller)=> TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: ' ${controller.facture.email}',
                              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        const Text('fullname', style: TextStyle(color: Colors.black , ),).tr(),
                        GetBuilder<AdminFactureDetailController>(
                          builder:(controller)=> TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: ' ${controller.facture.name}',
                              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        const Text('montant', style: TextStyle(color: Colors.black , ),).tr(),
                        GetBuilder<AdminFactureDetailController>(
                          builder:(controller)=> TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: ' ${controller.facture.montant} Dh',
                              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 1.w),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 140.w,
                              child: Column(
                                children: [
                                  const Text('montantpayee', style: TextStyle(color: Colors.black , ),).tr(),
                                  GetBuilder<AdminFactureDetailController>(
                                    builder:(controller)=>TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: '${controller.facture.montantpaye} Dh',
                                        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
                                        labelStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            20.horizontalSpace,
                            SizedBox(
                              width: 140.w,
                              child: Column(
                                children: [
                                  const Text('montantreste', style: TextStyle(color: Colors.black , ),).tr(),
                                  GetBuilder<AdminFactureDetailController>(
                                    builder:(controller)=> TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        labelText: '${controller.facture.montantreste} Dh',
                                        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 34.w),
                                        labelStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        const Text('createdat', style: TextStyle(color: Colors.black , ),).tr(),
                        GetBuilder<AdminFactureDetailController>(
                          builder:(controller)=>TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: ' ${controller.facture.createdAt?.split(':')[0]}',
                              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        20.verticalSpace,
                        const Text('type', style: TextStyle(color: Colors.black , ),).tr(),
                        GetBuilder<AdminFactureDetailController>(
                          builder:(controller)=> TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: ' ${controller.facture.type}',
                              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        12.verticalSpace,
                      ]
                  ),
                ),
                GetBuilder<AdminFactureDetailController>(
                  builder:(controller)=> ElevatedButton(
                    onPressed: () {
                      DeletePopup(context,'deleteaccount'.tr(), controller.facture.id! , 'facture', AdminHomeScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD16868),
                    ),
                    child:const Text('delete',style: TextStyle(color: Colors.white),).tr(),
                  ),
                ),
              ],
            ),
          )
      ),

    );
  }
}
