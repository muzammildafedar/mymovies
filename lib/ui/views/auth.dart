import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:mymovies/core/provider/firebase_auth.dart';
import 'package:mymovies/ui/shared/buttons.dart';
import 'package:mymovies/utils/constant/colors.dart';
import 'package:mymovies/utils/constant/routename.dart';

class AuthToStart extends StatefulWidget {
  const AuthToStart({Key? key}) : super(key: key);

  @override
  State<AuthToStart> createState() => _AuthToStartState();
}

class _AuthToStartState extends State<AuthToStart> {
  doSignIn() {
    var auth;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      auth = Provider.of<Auth>(context, listen: false).signInWithGoogle();
    });
    print(auth);
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    //     BoxConstraints(
    //         maxWidth: MediaQuery.of(context).size.width,
    //         maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(360, 690),
    //     context: context,
    //     minTextAdapt: true,
    //     orientation: Orientation.portrait);

    return Consumer<Auth>(builder: (ctx, model, child) {
      {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 200,
              backgroundColor: white,
              bottom: const TabBar(
                indicatorColor: bgcolor,
                labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                labelColor: black,
                tabs: [
                  Tab(
                    child: Text("Login",
                        style: TextStyle(
                            fontFamily: "SF",
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                  Tab(
                    child: Text("Sigup",
                        style: TextStyle(
                            fontFamily: "SF",
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                    child: login(
                  context,
                  model.signInWithGoogle,
                )),
                SingleChildScrollView(child: register(context)),
              ],
            ),
          ),
        );
      }
    });
  }
}

loginAuth() {
  print("Login");
}

Widget login(BuildContext context, VoidCallback onpressed) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(height: 18.h),
      textField("Email address"),
      SizedBox(height: 18.h),
      textField("Password"),
      SizedBox(height: 18.h),
      GestureDetector(
        child: Text("Forgot passcode?",
            style: TextStyle(color: bgcolor, fontWeight: FontWeight.bold)),
        onTap: () async {
          print("Forgot passcode");
        },
      ),
      SizedBox(height: 18.h),
      primaryActionButton(() async {
        await FirebaseAuth.instance.signOut();
      }, "Login", context,
          textColor: white,
          color: bgcolor,
          height: 45.h,
          width: 250.w,
          fontSize: 17),
      Container(
        width: 274.w,
        height: 45.h,
        child: SignInButton(
          Buttons.Google,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.h),
          ),
          onPressed: onpressed,
        ),
      )
    ],
  );
}

Widget register(BuildContext context) {
  registerAuth() {
    Navigator.pushReplacementNamed(context, RoutePaths.ProfileSetup);
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        height: 10.h,
      ),
      textField("Email address"),
      SizedBox(
        height: 10.h,
      ),
      textField("Passowrd"),
      SizedBox(
        height: 10.h,
      ),
      textField("Confirm password"),
      SizedBox(
        height: 10.h,
      ),
      GestureDetector(
        child: Text("Already have account? Login",
            style: TextStyle(color: bgcolor, fontWeight: FontWeight.bold)),
        onTap: () async {
          print("Forgot passcode");
        },
      ),
      SizedBox(
        height: 10.h,
      ),
      primaryActionButton(registerAuth, "Sign up", context,
          textColor: white,
          color: bgcolor,
          height: 45.h,
          width: 250.w,
          fontSize: 17)
    ],
  );
}
