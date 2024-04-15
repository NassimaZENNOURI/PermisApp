import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Components/appVars.dart';
import 'package:permisapp/controllers/admin/login_controller.dart';
import '../../controllers/admin/admin_length_controller.dart';
import '../../utils/services.dart';
import 'admin_home_screen.dart';
import 'candidat_list.dart';
import 'car_list.dart';
import 'coatch_list.dart';
import 'inscription_list.dart';
import 'Profile_File.dart';
import 'school_list.dart';
import 'seance_list.dart';
import '../settings_page.dart';
import 'user_list.dart';
import 'facture_list.dart';

class DrawerNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [firstGrad, secondGrad],
          stops: [0.5, 1.0],
        ),
      ),
      child: Drawer(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: GetBuilder<AdminLengthController>(
            init: AdminLengthController(),
            builder: (controller) => Column(
              children: [
                30.verticalSpace,
                Center(
                  child: Column(
                    children: [
                      15.verticalSpace,
                      Text(
                        controller.user.name.toString(),
                        style: TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      2.verticalSpace,
                      Text(
                        controller.user.email.toString(),
                        style: TextStyle(
                          fontFamily: 'cairo',
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Container(
                  color: Colors.white,
                  height: 1.sp,
                ),
                21.verticalSpace,
                Padding(
                        padding: EdgeInsets.symmetric(horizontal: 34.0.w , ),
                        child:Row(children: [
                          Container(
                            color: Colors.white,
                            height: 600.sp,
                            width: 1.sp,
                          ),
                          20.horizontalSpace,
                          Column(
                            children: [
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(AdminHomeScreen());

                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.home,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('homepage',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(InscriptionList());

                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.send,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('demandinsc',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(Profile_File());
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.profile,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('profile',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(SchoolList() );

                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.bookmark,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('school2',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(CandidatsList());

                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.user_3,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('candidats',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(CoatchsList());
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.user_3,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('coatch',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(UsersList());

                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.user_3,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('users',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(facturalList());

                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.graph,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('state',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(CarsList() );

                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.ticket,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('cars1',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    // Get.back(result: context);
                                    Get.to(SeancesList() );
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.calendar,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('cours',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),

                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    Get.to(SettingsPage() );

                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.setting,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('settings',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                              20.verticalSpace,
                              InkWell(
                                  onTap: (){
                                    Get.back(result: context);
                                    logOut(context);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        IconlyBroken.logout,
                                        color: Colors.white,
                                        size: 24.sp,
                                      ),
                                      11.horizontalSpace,
                                      Text('logout',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontFamily: 'cairo',
                                        ),
                                      ).tr()
                                    ],
                                  )
                              ),
                            ],
                          )
                        ],)
                    ),
              ],
            ),
          )
        ),
      ),
    );
  }
}


