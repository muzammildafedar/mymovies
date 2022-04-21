import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymovies/utils/constant/colors.dart';

Widget primaryActionButton(
    VoidCallback? onPress, String text, BuildContext context,
    {double? radius,
    double fontSize = 30,
    FontWeight fontWeight = FontWeight.w600,
    bool small = false,
    double? padding,
    Color? color,
    double? height,
    double? width,
    Color textColor = Colors.white}) {
  return Padding(
      padding: EdgeInsets.all(17.0),
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 80.h)),
        onPressed: onPress,
        child: Container(
          height: height ?? 80.h,
          alignment: Alignment.center,
          width: width,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontFamily: "SF",
                fontSize: fontSize.sp,
                fontWeight: fontWeight),
            textAlign: TextAlign.center,
          ),
        ),
      ));
}

Widget textField(
  String label,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: TextFormField(
      style: TextStyle(color: black, fontFamily: "SF"),
      cursorColor: black,
      decoration: InputDecoration(
          border: UnderlineInputBorder(),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: label,
          labelStyle: TextStyle(color: black, fontFamily: "SF", fontSize: 20)),
    ),
  );
}
