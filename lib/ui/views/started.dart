import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:mymovies/core/provider/firebase_auth.dart';
import 'package:mymovies/ui/shared/buttons.dart';
import 'package:mymovies/ui/views/auth.dart';
import 'package:mymovies/utils/constant/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mymovies/utils/constant/routename.dart';

class GettingStarted extends StatefulWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  State<GettingStarted> createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  @override
  void initState() {
    String? user;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      user = Provider.of<Auth>(context, listen: false).getUserDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    getStarted() {
      Navigator.pushReplacementNamed(context, RoutePaths.Auth);
    }

     // ScreenUtil.init(
     //    BoxConstraints(
     //        maxWidth: MediaQuery.of(context).size.width,
     //        maxHeight: MediaQuery.of(context).size.height),
     //    designSize: Size(360, 690),
     //    context: context,
     //    minTextAdapt: true,
     //    orientation: Orientation.portrait);
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Learn from everyone",
                style: TextStyle(color: white, fontFamily: "SF", fontSize: 51),
              ),
            ),
            Stack(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Positioned(
                  // left: 0,
                  // right: 10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: 0,
                          sigmaY: 0.5,
                        ),
                        child: Image.asset(
                          "assets/img/get1.png",
                          width: 250.w,
                          height: 200.h,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 55,
                  right: 75,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/img/get2.png",
                      width: 200.w,
                      height: 200.h,
                    ),
                  ),
                ),
              ],
            ),
            primaryActionButton(getStarted, "Get Started", context,
                textColor: bgcolor,
                color: white,
                padding: 10,
                radius: 30,
                height: 50.h,
                width: 250.w,
                fontSize: 17)
          ],
        ),
      ),
    );
  }
}
