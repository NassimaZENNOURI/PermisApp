

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iconly/iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../Components/functions.dart';
import '../../controllers/coatch/coatch_home_controller.dart';
import 'coach_drawer_navigator.dart';
import 'coatch_home.dart';

class CoatchHomeScreen extends StatelessWidget {
  const CoatchHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoatchHomeController>(
      init: CoatchHomeController(),
      builder:(controller)=> SafeArea(child: WillPopScope(
          onWillPop:()=>
              showExitPopup(context,  "quit".tr),
          child: Scaffold(
            body: controller.isLoading.value == true ? const Loading() : ProvidedStylesExample(menuScreenContext:context),
          ),
        )),
    );

  }
}

class ProvidedStylesExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  const ProvidedStylesExample(
      {Key? key,required this.menuScreenContext}) : super(key: key);

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _buildScreens() {
    return [
      const CoatchHome(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          IconlyBroken.home,
          size: 29.sp,
        ),
        title: "Home",
        activeColorPrimary: PrimaryColor,
        inactiveColorPrimary: PrimaryColor,
        inactiveColorSecondary: PrimaryColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text("homepage").tr(),
        titleTextStyle: TextStyle(
            fontFamily: 'cairo', fontSize: 16.sp, fontWeight: FontWeight.bold),
        centerTitle: true,

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

        toolbarHeight: 80.h,
        elevation: 0,
        leading: InkWell(
          onTap: () => key.currentState!.openDrawer(),
          child: Icon(
            color: Colors.white,
            IconlyBroken.category,
            size: 35.h,
          ),
        ),
      ),
      drawer: const CoatchDrawerNavigator(),
      body: const CoatchHome(),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CoatchDrawerNavigator(),
      backgroundColor: PrimaryBg,
      appBar: AppBar(
        title: const Text('homepage').tr(),
      ),
      body: Column(
        children: [
          GetBuilder<CoatchHomeController>(
            init: CoatchHomeController(),
            builder:(controller) => ListTile(
              onTap: () => controller.changeToFrench(context),
              title: const Text('language2').tr(),
            ),
          ),

          // to change language with Extension
          GetBuilder<CoatchHomeController>(
            builder:(controller) => ListTile(
              onTap: () => controller.changeToArabic(context),
              title: const Text('language1').tr(),
            ),
          ),
          Text(
              'Current Locale: ${Localizations.localeOf(context).toString()}'),
          // Text('Current Locale: ' + context.currentLocale.languageCode), // with Extension
        ],
      ),
    );
  }
}
