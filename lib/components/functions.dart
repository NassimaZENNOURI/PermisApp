import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../controllers/admin/controller.dart';
import 'appVars.dart';



void showAchievementView(bool status, text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: status ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0.sp);
}
Future<Future> DeleteCarPopup(context, text, int id, Widget widget) async {
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
                      "deleteuser",
                      style: TextStyle(
                        fontFamily: 'cairo',
                        color: const Color(0xFFD16868),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      // textAlign: TextAlign.center,
                    ).tr(),
                    Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'cairo',
                        fontSize: 14.sp,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        GetBuilder<Controller>(
                          init: Controller(),
                          builder:(controller)=> Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD16868),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)),
                                ),
                                onPressed: () async {
                                  controller.deleteCar(context, id, widget);
                                },
                                child: Text(
                                  "oui",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'cairo',
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
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
      ));
}
Future<bool> showExitPopup(context, title) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                20.verticalSpace,
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                          height: 36.h,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient:  const LinearGradient(
                                  colors: [firstGrad, secondGrad]),
                            ),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.transparent),
                              ),
                              onPressed: () {
                                exit(0);
                              },
                              child: Text(
                                "oui",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: 'cairo',
                                    fontWeight: FontWeight.bold),
                              ).tr(),
                            ),
                          ),
                        )),
                    15.horizontalSpace,
                    Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: PrimaryColor, width: 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0.r)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "non",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: 'cairo',
                                fontWeight: FontWeight.bold),
                          ).tr(),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
DeletePopup(context, text, int id, String type, Widget widget) async {
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
                        type == 'candidat'
                            ? Text(
                                "deletecandid",
                                style: TextStyle(
                                  fontFamily: 'cairo',
                                  color: const Color(0xFFD16868),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                //textAlign: TextAlign.center,
                              ).tr()
                            : type == 'seance'
                                ? Text('deleteseance').tr()
                                : type == 'facture'
                                    ? Text('deletefacture').tr()
                                    : type == 'user'
                                        ? Text(
                                            "deleteuser",
                                            style: TextStyle(
                                              fontFamily: 'cairo',
                                              color: const Color(0xFFD16868),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            //textAlign: TextAlign.center,
                                          ).tr()
                                        : type == 'school'
                                            ? Text(
                                                "deleteschool",
                                                style: TextStyle(
                                                  fontFamily: 'cairo',
                                                  color:
                                                      const Color(0xFFD16868),
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                //textAlign: TextAlign.center,
                                              ).tr()
                                            : Text(
                                                "deletecoatch",
                                                style: TextStyle(
                                                  fontFamily: 'cairo',
                                                  color:
                                                      const Color(0xFFD16868),
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                //textAlign: TextAlign.center,
                                              ).tr(),
                        Text(
                          text,
                          style: TextStyle(
                            fontFamily: 'cairo',
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ).tr(),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            GetBuilder<Controller>(
                              init: Controller(),
                              builder: (controller) => Expanded(
                                  child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: const Color(0xFFD16868),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                    onPressed: () {
                                  controller.delete(context, type, id, widget);
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
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                  ),
                                  onPressed: () {
                                    print('no selected');
                                Navigator.pop(context);
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
          ));
}


