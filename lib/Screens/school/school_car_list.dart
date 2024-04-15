import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:permisapp/Screens/school/school_add_car.dart';
import 'package:permisapp/Screens/school/school_car_detail.dart';
import 'package:permisapp/Screens/school/school_drawer_navigator.dart';
import 'package:permisapp/components/Loading.dart';
import '../../Components/appVars.dart';
import '../../controllers/school/school_car_list_controller.dart';

class SchoolCarsList extends StatelessWidget {
  const SchoolCarsList({Key? key}) : super(key: key);

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
      drawer: const SchoolDrawerNavigator(),
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
      backgroundColor: PrimaryBg,
      body: GetBuilder<SchoolCarListController>(
        init: SchoolCarListController(),
        builder: (controller) => controller.isLoading.value
            ? const Loading()
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      25.verticalSpace,
                      Text(
                        'cars',
                        style: TextStyle(
                          color: Dark,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ).tr(),
                      5.verticalSpace,
                      GetBuilder<SchoolCarListController>(
                        init: SchoolCarListController(),
                        builder:(controller)=> TextField(
                            onChanged: (value) {
                              controller.update();
                            },
                            controller: controller.searchController,
                            style: const TextStyle(color: gray),
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                IconlyBroken.search,
                                color: Gry3,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 13.w),
                              focusColor: PrimaryColor,
                              labelText: StringTranslateExtension('search').tr(),
                              labelStyle: TextStyle(
                                  color: gray,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "cairo",
                                  fontSize: 14.sp),
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.9,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: const BorderSide(
                                    color: Gry3,
                                    width: 1.9,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r)),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.9,
                                  )),
                            )
                        ),
                      ),
                      15.verticalSpace,
                      Container(
                        height: 480.h,
                        child: GetBuilder<SchoolCarListController>(
                          init: SchoolCarListController(),
                          builder: (controller) => GridView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: controller.search().length,
                            itemBuilder: (context, index) {
                              final carModel = controller.search()[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                      SchoolCarDetail() , arguments: [carModel]
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 160.w,
                                    height: 145.h,
                                    child: Container(
                                        height: 79.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Gry3, width: 1.2.w),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.r))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Spacer(),
                                            SizedBox(
                                              width: 60,
                                              child: AspectRatio(
                                                aspectRatio: 60 / 60,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(70.r)),
                                                  child: CachedNetworkImage(
                                                    width: 55.w,
                                                    height: 55.h,
                                                    fit: BoxFit.cover,
                                                    imageUrl: '$car/${carModel.photo}', progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                            Center(child: CircularProgressIndicator(value: downloadProgress.progress),
                                                    ),
                                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              carModel.brand.toString() ?? ' ',
                                              style: TextStyle(
                                                color: Dark,
                                                fontSize: 14.sp,
                                                fontFamily: 'cairo',
                                              ),
                                            ),
                                            const Spacer(),
                                          ],
                                        )),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      floatingActionButton: SizedBox(
        width: 60.w,
        height: 60.w,
        child: FloatingActionButton(
          backgroundColor: PrimaryColor,
          child: Icon(
            IconlyBroken.plus,
            size: 25.sp,
          ),
          onPressed: () {
            Get.to(SchoolAddCar());
          },
        ),
      ),
    );
  }
}
