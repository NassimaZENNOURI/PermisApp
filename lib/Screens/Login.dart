import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permisapp/controllers/admin/login_controller.dart';
import '../Components/functions.dart';
import '../Components/appVars.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {


    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    final LoginController c = Get.put(LoginController());
    return  SafeArea(
      child: WillPopScope(
        onWillPop: () => showExitPopup(
            context,
            'Quit'
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                if (!isKeyboard)
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/splashlogo.png",
                        scale: 2.5,
                      ),
                    ),
                  ),
                12.verticalSpace,
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "cairo",
                        color: PrimaryColor,
                      ),
                    ).tr(),
                7.verticalSpace,
                Text(
                  'logintocontinueon',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: "cairo",
                    color: PrimaryColor,
                  ),
                ).tr(),
                30.verticalSpace,

                GetBuilder<LoginController>(
                  init: LoginController(),
                  builder:( controller )=> Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child:  TextFormField(
                            autocorrect: false,
                            autofocus: true,
                            controller: controller.emailcontroller,
                            onChanged: (value) => controller.setemail(value),
                            decoration: InputDecoration(
                              hintText: StringTranslateExtension('Email').tr(),
                              suffixIcon: const Icon(Icons.email,color: PrimaryColor),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: PrimaryColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: PrimaryColor)),
                            ),
                          ),
                      ),
                      20.verticalSpace,
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TextFormField(
                            autocorrect: false,
                            controller: controller.pwdcontroller,
                            onChanged: (value) => controller.setpassword(value),
                            validator: (value){
                              if(value!.isEmpty){
                                return StringTranslateExtension('*InsertPassword').tr();
                              }
                            },
                            obscureText: controller.isObscure.value,
                            decoration: InputDecoration(
                                hintText: StringTranslateExtension('Password').tr(),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      controller.isObscure.value ? Icons.visibility_off : Icons.visibility
                                  ,color: PrimaryColor,) ,
                                  onPressed: () => controller.toggleObscure(),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color:PrimaryColor),
                                ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: PrimaryColor)
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder:(controller) => GestureDetector(
                          child: SelectableText.rich(
                              TextSpan(
                                  text: StringTranslateExtension('ForgetPassword').tr(),
                                  style: const TextStyle(color: PrimaryColor),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: controller.recognizer2
                              )
                          ),
                          // Text(
                          //   "ForgetPassword",
                          //   style: TextStyle(
                          //     color: PrimaryColor,
                          //     fontSize: 14.sp,
                          //     fontFamily: 'cairo',
                          //   ),
                          // ).tr(),
                        ),
                      ),
                    ],
                  ),
                ),
                15.verticalSpace,
                GetBuilder<LoginController>(
                    builder: (controller) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: ElevatedButton(
                        onPressed: () async {
                          controller.submit();
                        },

                        style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: PrimaryColor,
                            minimumSize: const Size.fromHeight(3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(14)
                        ),
                        child: const Text("Login",style: TextStyle(color: Colors.white),).tr(),
                      ),
                    )
                ),
                isKeyboard ? 10.verticalSpace : 50.verticalSpace,
                GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (controller) => GestureDetector(
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text('Youdonothaveanaccount ').tr(),
                        SelectableText.rich(
                            TextSpan(
                                text: tr('Register_now'),
                                style: const TextStyle(color: Colors.blue),
                                mouseCursor: SystemMouseCursors.click,
                                recognizer: controller.recognizer1
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<LoginController>(
                      builder: (controller) => GestureDetector(
                        onTap: (){
                          controller!.changeToFrench(context);
                        },
                        child: const Text('French',
                          style: TextStyle(
                            color: PrimaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: PrimaryColor,
                            decorationThickness: 2.0,
                          ),).tr(),
                      ),
                    ),
                 25.horizontalSpace,
                    GetBuilder<LoginController>(
                      builder: (controller) => GestureDetector(
                        onTap: (){
                          controller.changeToArabic(context);
                        },
                        child: const Text('Arabic',
                          style: TextStyle(
                            color: PrimaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: PrimaryColor,
                            decorationThickness: 2.0,
                          ),).tr(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}