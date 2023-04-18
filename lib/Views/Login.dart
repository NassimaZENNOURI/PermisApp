import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controllers/AuthController.dart';
import '../apiFunctions/Authentification.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFF6067FA),
                Colors.blue
              ],
            begin: Alignment.topCenter,
          )
        ),
        child: Column(
          children: [
            30.verticalSpace,
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    //child: Image.asset('images/dabapermis.png',),
                    child: Padding(padding: EdgeInsets.all(50),),
                  ),
                  15.verticalSpace,
                  Center(
                    child: Text('Connectez-vous pour continuer sur DabaPermis.', style: TextStyle(color: Colors.white,fontSize: 16 , fontWeight: FontWeight.bold),).tr(),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 30.h,),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: GetBuilder<AuthController>(
                                init: AuthController(),
                                builder: (controller)=> Column(
                                  children: [
                                    TextFormField(
                                      autocorrect: false,
                                      autofocus: true,
                                      //controller: controller.,
                                      onChanged: (value) => controller.setemail(value),
                                      //validator: (value)=> value == null || !RegExp(r"[a-z0-9\.-]+@[a-z0-9\.-]+\.[a-z]+").hasMatch(value) ? "s'il vous plait entre un email valide" : null,
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        suffixIcon: const Icon(Icons.email),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: const BorderSide(color: Colors.blue)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: const BorderSide(color: Colors.blue)),
                                      ),
                                    ),
                                    12.verticalSpace,
                                    TextFormField(
                                      autocorrect: false,
                                      //controller: controller.pwdcontroller,
                                      onChanged: (value) => controller.setpassword(value),
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return '*Insérer le mot de passe';
                                        }
                                      },
                                      obscureText: controller.isObscure.value,
                                      decoration: InputDecoration(
                                          hintText:'Mot de passe',
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                                controller.isObscure.value ? Icons.visibility_off : Icons.visibility
                                            ) ,
                                            onPressed: () => controller.toggleObscure(),
                                          )  ,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            borderSide: const BorderSide(color: Colors.blue),

                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h,),
                            Text('J\'ai oublié le mot de passe', style: TextStyle(color: Colors.blue),).tr(),
                            SizedBox(height: 40.h,),
                            GetBuilder<AuthController>(
                                builder: (controller) => ElevatedButton(
                                  onPressed: () async {
                                    Authentification auth = Authentification();
                                    var res = await auth.login(controller.email.value , controller.password.value) ;
                                    print('------------------>>${res}');
                                    controller.submit();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      padding: const EdgeInsets.all(20)
                                  ),
                                  child: Text('Connexion',style: TextStyle(fontSize: 20),).tr(),
                                ),
                            ),
                            SizedBox(height: 40.h,),
                            GetBuilder<AuthController>(
                                builder: (controller) => GestureDetector(
                                  // onTap: (){Get.to(Signup());},
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      Text('Vous n\'avez pas de compte  ').tr(),
                                      SelectableText.rich(
                                          TextSpan(
                                            text: StringTranslateExtension('S\'inscrire maintenant').tr(),
                                            style: TextStyle(color: Colors.blue),
                                            mouseCursor: SystemMouseCursors.click,
                                            recognizer: controller.recognizer
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                            ),
                            SizedBox(height: 40.h,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: Text('Français',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      decorationThickness: 2.0,
                                    ),).tr(),
                                ),
                                SizedBox(width: 25.w,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Text('English',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      decorationThickness: 2.0,
                                    ),).tr(),
                                ),
                                SizedBox(width: 25.w,),
                                GestureDetector(
                                  onTap: (){},
                                  child: Text('Arabic',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.blue,
                                      decorationThickness: 2.0,
                                    ),).tr(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }


}


