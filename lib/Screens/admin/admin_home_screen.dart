import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import '../../Components/appVars.dart';
import '../../components/functions.dart';
import 'admin_home.dart';
import 'drawer_navigator.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({ Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
          onWillPop: () => showExitPopup(
              context,
              Locales.string(
                context,
                "quit",
              )),
          child: Scaffold(
            body: ProvidedStylesExample(
              menuScreenContext: context,
            ),
          ),
        ));
  }
}

class ProvidedStylesExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  const ProvidedStylesExample(
      {Key? key, required this.menuScreenContext}) : super(key: key);

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
      const AdminHome(),
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
      PersistentBottomNavBarItem(
        icon: Icon(
          IconlyBroken.graph,
          size: 29.sp,
        ),
        title: ("book"),
        activeColorPrimary: PrimaryColor,
        inactiveColorPrimary: PrimaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          IconlyBroken.play,
          size: 29.sp,
        ),
        title: ("Add"),
        activeColorPrimary: PrimaryColor,
        activeColorSecondary: PrimaryColor,
        inactiveColorPrimary: PrimaryColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey();
    return Scaffold(
        key: key,
        appBar: AppBar(
          title: const Text("homepage",).tr(),
          titleTextStyle: TextStyle(
              fontFamily: 'cairo',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
          centerTitle: true,

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
          leading: InkWell(
            onTap: () => key.currentState!.openDrawer(),
            child: Icon(
              color:  Colors.white,
              IconlyBroken.category,
              size: 35.h,
            ),
          ),
        ),
        drawer:  DrawerNavigator(),
        body: const AdminHome()

    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  DrawerNavigator(),
      backgroundColor: PrimaryBg,
      appBar: AppBar(
        title: const LocaleText('homepage'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => Locales.change(context, 'fr'),
            title: const LocaleText('language2'),
          ),

          // to change language with Extension
          ListTile(
            onTap: () => context.changeLocale('ar'),
            title: const LocaleText('language1'),
          ),
          Text(
              'Current Locale: ${Locales.currentLocale(context)!.languageCode}'),
          // Text('Current Locale: ' + context.currentLocale.languageCode), // with Extension
        ],
      ),
    );
  }
}
