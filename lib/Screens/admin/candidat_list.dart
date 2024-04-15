import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../../Components/Loading.dart';
import '../../Components/functions.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/candidat_list_controller.dart';
import 'admin_home_screen.dart';
import 'detail_candidat.dart';

class CandidatsList extends StatelessWidget {
  const CandidatsList({Key? key}) : super(key: key);

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
        body:  GetBuilder<ListCandidatController>(
          init : ListCandidatController(),
          builder: (controller) {
            return controller.isLoading.value ? Loading(): Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start  ,
                children: [
                  25.verticalSpace,
                  Text(
                    'candid',
                    style: TextStyle(
                      color: Dark,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ).tr(),
                  15.verticalSpace,
                  GetBuilder<ListCandidatController>(
                    init: ListCandidatController(),
                    builder: (controller) => TextFormField(
                      controller: controller.searchController,
                      onChanged: (value) {
                        controller.update();
                      },
                      decoration: InputDecoration(
                        hintText: StringTranslateExtension('search').tr(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.sp,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace,
                  Expanded(
                      child: GetBuilder<ListCandidatController>(
                        builder: (controller) => ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.search().length,
                          itemBuilder: (BuildContext context, int index) {
                            final candidate = controller.search()[index];
                            return Column(
                              children: [
                                14.verticalSpace,
                                InkWell(
                                  onTap: (){
                                    Get.to(
                                        DetailCandidat() , arguments: [candidate]
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xFFC9C9C9).withOpacity(0.12),
                                            blurRadius: 20,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.all(Radius.circular(12.r))
                                    ),
                                    width: 300.w,
                                    height: 93.h,
                                    child: Row(
                                      children: [
                                        Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:[
                                              13.verticalSpace,
                                              Row(
                                                children: [
                                                  2.horizontalSpace,
                                                  ClipRRect(
                                                      borderRadius: BorderRadius.all(Radius.circular(90.r)),
                                                      child: CachedNetworkImage(
                                                        width: 55.w,
                                                        height: 55.h,
                                                        fit: BoxFit.cover,
                                                        imageUrl: '$canpict/${candidate.photo}',
                                                        progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress),),
                                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                                      )
                                                  ),
                                                  16.horizontalSpace,
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        candidate.name.toString(),
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: 'cairo',
                                                          color: Dark,
                                                        ),
                                                      ),
                                                      Text(
                                                        candidate.schoolName.toString(),
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontFamily: 'cairo',
                                                          color: gray,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),

                                            ]
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 17.w),
                                          child: FocusedMenuHolder(
                                            menuWidth: MediaQuery.of(context).size.width*0.50,
                                            blurSize: 5.0,
                                            menuItemExtent: 45,
                                            menuBoxDecoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(25.0.r))),
                                            duration: const Duration(milliseconds: 100),
                                            animateMenuItems: false,
                                            blurBackgroundColor: Colors.black54,
                                            bottomOffsetHeight: 100,
                                            openWithTap: true,
                                            menuItems: <FocusedMenuItem>[
                                              FocusedMenuItem(
                                                  title: Text("details",
                                                    style: TextStyle(
                                                      color:Dark,
                                                      fontFamily: 'cairo',
                                                      fontSize: 14.sp,
                                                    ),
                                                  ).tr(),
                                                  trailingIcon: const Icon(IconlyBroken.profile) ,
                                                  onPressed: (){
                                                    Get.to(
                                                      DetailCandidat(), arguments: [candidate]
                                                    );
                                                  }
                                                   ),
                                              FocusedMenuItem(
                                                  title: Text("remove",style: TextStyle(
                                                    color:const Color(0XFFFF0000),
                                                    fontFamily: 'cairo',
                                                    fontSize: 14.sp,
                                                  ),).tr(),
                                                  trailingIcon: const Icon(Icons.delete,color: Color(0XFFFF0000),) ,
                                                  onPressed: (){
                                                    // print(id[i]);
                                                    DeletePopup(context, StringTranslateExtension('deleteaccount').tr() ,candidate.id!,'candidat',AdminHomeScreen());

                                                  }),
                                            ],
                                            onPressed: (){},
                                            child: Icon(
                                              candidate.id!=0?    IconlyBroken.more_square:null,
                                              color: Gry3,
                                              size: 23.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                10.verticalSpace,
                              ],
                            );


                          },

                        ),
                      )
                  )
                ],
              ),
            );
          }
        ),
      );
  }
}
