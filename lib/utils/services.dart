import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permisapp/Screens/coach/coach_home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/Login.dart';
import '../Screens/admin/admin_home_screen.dart';
import '../Screens/condidat/candidat_home_screen.dart';
import '../Screens/school/school_home_screen.dart';
import 'models/Users.dart';


Future<Widget> initWidget() async {
  Widget mainPage = const Login();
  bool? loggedIn = await SessionManager().get("isloggedin");
  if (loggedIn != null && loggedIn) {
    await getUserFromMemory()!.then((value) {
      print(value.role);
      if (value.role == "ROLE_ADMIN") {
        mainPage =  AdminHomeScreen();
      } else if(value.role == "ROLE_SCHOOL"){
        mainPage =  SchoolHomeScreen();
      }else if(value.role == "ROLE_COACH"){
        mainPage =  CoatchHomeScreen();
      }else if (value.role == "ROLE_CANDIDAT"){
        mainPage = CandidatHomeScreen();
      } else {
        mainPage = const Login();
      }
    });
  } else {
    mainPage = const Login();
  }

  return mainPage;
}


getUserFromMemory() async {
  return User.fromJson(await SessionManager().get("user"));
}

logOut(context) async {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0.r))),
        content: SingleChildScrollView(
          child: Builder(
            builder: (context) {
              return SizedBox(
                width: 335.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "logout",
                      style: TextStyle(
                        fontFamily: 'cairo',
                        color: const Color(0xFFD16868),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      //textAlign: TextAlign.center,
                    ).tr(),
                    Text(
                      'question',
                      style: TextStyle(
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.center,
                    ).tr(),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFFD16868),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              onPressed: () async {
                                final prefs = await SharedPreferences.getInstance();
                                var fcm = await  SessionManager().get("fcm");
                                await SessionManager().remove("user");
                                await SessionManager().set("loggedin", false);
                                await SessionManager().set("token", "");
                                await SessionManager().set("user", "");
                                Navigator.of(context).popUntil((route) => route.isFirst);
                                Get.offAll(() => const Login());
                                prefs.clear();
                                prefs.commit();
                                prefs.setBool('seen', true);
                                await SessionManager().set("fcm", fcm);
                              },
                              child: Text(
                                "oui",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                            )),
                        const SizedBox(width: 15),
                        Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color(0xFFD16868), width: 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.0.r)),
                              ),
                              onPressed: () {
                                Get.back(result: context);
                              },
                              child: Text(
                                "non",
                                style: TextStyle(
                                    color: const Color(0xFFD16868),
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                            ))
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      )
  );
}

