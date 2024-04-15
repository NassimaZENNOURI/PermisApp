import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/admin/inscription_list_controller.dart';
import 'detail_inscription.dart';

class InscriptionList extends StatelessWidget {
  const InscriptionList({Key? key}) : super(key: key);

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
      body: GetBuilder<ListInscriprionController>(
        init: ListInscriprionController(),
        builder: (controller) {
          return controller.isLoading.value ? Loading(): Padding(
            padding:   EdgeInsets.symmetric(horizontal: 20.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start  ,
              children: [
                20.verticalSpace,
                Text(
                  'inscriptions',
                  style: TextStyle(
                    color: Dark,
                    fontFamily: 'cairo',
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ).tr(),
                15.verticalSpace,
                GetBuilder<ListInscriprionController>(
                  init: ListInscriprionController(),
                  builder: (controller) => TextField(
                      onChanged: (value) {
                        controller.update();
                      },
                      style: const TextStyle(color:  gray),
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                        suffixIcon: const Icon(
                          IconlyBroken.search,
                          color: gray,
                        ),
                        focusColor: PrimaryColor,
                        labelText:StringTranslateExtension("search").tr(),
                        labelStyle: TextStyle(
                            color: gray,
                            fontWeight: FontWeight.bold,
                            fontFamily: "cairo",
                            fontSize: 14.sp),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.9.w,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: const BorderSide(
                              color: Gry3,
                              width: 1.9,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.r)),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.9,
                            )),
                      )),
                ),

                15.verticalSpace,
                Expanded(
                    child: GetBuilder<ListInscriprionController>(
                      builder: (controller) => ListView.builder(
                          itemCount: controller.search().length,
                        itemBuilder: (BuildContext context, int index) {
                          final inscp = controller.search()[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFC9C9C9).withOpacity(0.12),
                                    blurRadius: 20,
                                  ),
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(12.r))),
                            width: 500.w,
                            height: 93.h,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    13.verticalSpace,
                                    Row(
                                      children: [
                                        10.horizontalSpace,
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            20.verticalSpace,
                                            Text(
                                              inscp.fullname.toString() ,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'cairo',
                                                color: Dark,
                                              ),
                                            ),
                                            Text(
                                              '${inscp.email!.substring(0, inscp.email!.length > 17 ? 17 : inscp.email!.length)} ${inscp.email!.length > 17 ? '...' : ''}     ',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'cairo',
                                                color: gray,
                                              ),
                                            ),
                                          ],
                                        ),
                                        10.horizontalSpace,
                                        inscp.status !=5 ? Container(
                                          width: 65.w,
                                          height: 25.h,
                                          decoration:BoxDecoration(
                                              color:   inscp.status==100?Colors.red:inscp.status==1?Colors.green:Colors.orange,
                                              borderRadius: BorderRadius.all(Radius.circular(7.r)),
                                              border: Border.all(color:gray)
                                          ),
                                          child: Center(
                                            child: Text(
                                              inscp.status==0?'en attente':inscp.status==1?'accepté':'décliné',
                                              //inscp.status==100?StringTranslateExtension('no').tr():inscp.status==1?StringTranslateExtension('yes').tr():StringTranslateExtension('attend').tr(),
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'cairo',
                                                color: Colors.white,
                                              ),
                                            ).tr(),
                                          ),
                                        ) : Container(

                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: GetBuilder<ListInscriprionController>(
                                    init: ListInscriprionController(),
                                    builder:(controller) => FocusedMenuHolder(
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
                                          inscp.status == 1 ?
                                          FocusedMenuItem(
                                              title: Text(
                                                'accepted',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: 'cairo',
                                                  fontSize: 14.sp,
                                                ),
                                              ).tr(),
                                              trailingIcon: const Icon(
                                                  CupertinoIcons.check_mark,
                                                  color: Colors.green),
                                              onPressed: () async {}
                                          )
                                           : FocusedMenuItem(
                                              title: Text('tashghil',style: TextStyle(
                                            color:  Colors.green,
                                            fontFamily: 'cairo',
                                            fontSize: 14.sp,
                                          ),).tr(),
                                          trailingIcon: const Icon( CupertinoIcons.check_mark,color: Colors.green) ,
                                              onPressed: () async {
                                                controller.acceptUpdate(inscp.id!, inscp.status!);
                                              }),

                                          FocusedMenuItem(
                                              title: Text("details",
                                                style: TextStyle(
                                                  fontFamily: 'cairo',
                                                  fontSize: 14.sp,
                                                ),
                                              ).tr(),
                                              trailingIcon: const Icon(IconlyBroken.document) ,
                                              onPressed: (){
                                                Get.to(DetailInscription() , arguments: [inscp]);
                                              }),
                                        ],
                                        onPressed: (){},
                                        child: Icon(
                                          inscp.id!=0? IconlyBroken.more_square:null,
                                          color: secondGrad,
                                          size: 23.sp,
                                        ),
                                      ),
                                  ),

                                ),

                              ],
                            ),
                          );
                        },

                      ),
                    )
                ),

              ],
            ),
          );
        }
      ),

    );
  }
}

