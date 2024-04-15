import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../Components/Loading.dart';
import '../../Components/appVars.dart';
import '../../components/functions.dart';
import '../../controllers/candidat/candidat_home_screen_controller.dart';
import 'candidat_drawer_navigator.dart';
import 'candidat_home.dart';
import 'candidat_profile.dart';
import 'candidat_seances_list.dart';

class CandidatHomeScreen extends StatelessWidget {
  const CandidatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: () => showExitPopup(context,StringTranslateExtension("quit").tr()),
          child: GetBuilder<CandidatHomeScreenController>(
            init: CandidatHomeScreenController(),
            builder:(controller)=> Scaffold(
              body: controller.isloading.value ? const Loading() : ProvidedStylesExample(menuScreenContext: context, ),
            ),
          ),
        )
    );
  }
}

class ProvidedStylesExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  const ProvidedStylesExample({Key? key, required this.menuScreenContext}) : super(key: key);

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  List<Widget> _buildScreens() {
    return [const CandidatHome(), const CandidatSeancesList()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyBroken.home),
        title: "Home",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
        inactiveColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Boxicons.bx_stats),
        title: ("Add"),
        activeColorPrimary: Colors.white,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('homepage',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.sp,
            fontFamily: 'cairo',
          ),
        ).tr(),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [firstGrad, secondGrad],
              stops: [0.5, 1.0],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Transform.scale(
              scale: 1.5,
              child: GetBuilder<CandidatHomeScreenController>(
                init: CandidatHomeScreenController(),
                builder:(controller)=>  IconButton(
                  icon: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(90.r)),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        imageUrl: '$canpict/${controller.candidat.photo}',
                        height: 30.h,
                        width: 30.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  onPressed: () {
                    Get.to(
                      CandidatProfile() , arguments: [controller.candidat]
                    );
                  },
                ),
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
      drawer: const CandidatDrawerNavigator(),
      body: PersistentTabView(
        context,
        controller: PersistentTabController(),
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: PrimaryColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: 78.h,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        selectedTabScreenContext: (context) {},
        hideNavigationBar: false,
        decoration:  const NavBarDecoration(
          colorBehindNavBar: Colors.indigo,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style13, // Choose the nav bar style with this property
      ),
    );
  }
}