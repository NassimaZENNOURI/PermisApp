import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              30.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
                child: Container(
                  width: double.infinity.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        offset: new Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                  child: Center(child: Text(''),),
                ),
              ),
              10.verticalSpace,
              //_valuecontainer()
            ],
          )
        ],
      ),
    );
  }

  Widget _valuecontainer(String title, String data) {
    return Container(
      //width: width*0.27,height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        //color: AppColor.secondarybackgroundcolor,
        boxShadow: const [
          BoxShadow(
              color: Colors.white,
              //blurRadius: 2.0,
              offset: Offset(0, 5.0,)),
        ],),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 0, right: 0),
        child: Column(
          children: [
            Center(child: Text(title, style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            //Icon( color: color, size: 40),
            const SizedBox(height: 10,),
            Text(data, style: const TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }

}
