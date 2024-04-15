import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permisapp/Components/appVars.dart';


class NotificationPage extends StatelessWidget {
  final String? body ;
  final Map<String, dynamic>? additionalData;
  NotificationPage({this.body,this.additionalData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('norification_page',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),).tr(),
        backgroundColor: PrimaryColor,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 12.h),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: SecondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Text(body!, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w,),
                child: Container(
                  width: double.infinity,
                  height: 125,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: PrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      Text('Notre école est ajoutée une séance au moniteur: ${additionalData!['coachName']}'),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('la date debut est :'),Text(additionalData!['startdate'],style: TextStyle(fontWeight: FontWeight.bold, color: secondGrad),)
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('le duree du seance est :'),Text(additionalData!['periode'],style: TextStyle(fontWeight: FontWeight.bold , color: secondGrad),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 125,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: PrimaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      const Text('Consulter votre profile pour voir Les candidats concerner par la seance ',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
