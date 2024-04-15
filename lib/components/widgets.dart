import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'appVars.dart';



class SettingsMenuWidget extends StatelessWidget {
  const SettingsMenuWidget({
    Key? key ,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title ;
  final IconData icon ;
  final VoidCallback onPress ;
  final bool endIcon ;
  final Color? textColor ;

  @override
  Widget build(BuildContext context) {

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark ;
    var iconColor =  PrimaryColor ;

    return ListTile( //contient une à trois lignes de texte facultativement flanquées d'icônes ou d'autres widgets, tels que des cases à cocher.
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40 ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.2),
        ),
        child: Icon(icon , color: iconColor ,),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium?.apply(color: textColor)),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: PrimaryColor.withOpacity(0.4),
        ),
        child: const Icon(LineAwesomeIcons.angle_right, size: 19, color: Colors.grey,),
      ):null ,
    );
  }
}

class PrimaryTextField extends StatelessWidget {
  String hintText;
  TextEditingController? controller;
  Icon? prefixIcon;
  bool? visibility;
  bool? centered;
  PrimaryTextField({
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.visibility = false,
    this.centered = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.50),
            spreadRadius: -1,
            blurRadius: 7,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        readOnly: true,
        controller: controller,
        obscureText: visibility ?? false,
        textAlign: centered == true ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          filled: true,
          fillColor: Color.fromARGB(255, 243, 243, 243),
          prefixIconColor: Color(0xff14213D),
          hintText: tr(hintText),
          hintStyle: hintStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.r),
          ),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}

