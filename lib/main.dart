import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:mymovies/core/firebase_config.dart';
import 'package:mymovies/core/provider/firebase_auth.dart';
import 'package:mymovies/core/provider/stepper.dart';
import 'package:mymovies/ui/router.dart';
import 'package:mymovies/ui/views/started.dart';
import 'package:mymovies/utils/constant/routename.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'core/provider/my_fav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseConfig.platformOptions);

  // if (shouldUseFirestoreEmulator) {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StepperState(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyFavMovies(),
        ),
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
      ],
      child: Consumer<Auth>(
          builder: (_, auth, __) => ScreenUtilInit(
              designSize: Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_) {
                return MaterialApp(
                  initialRoute:
                      auth.isSignedIn ? RoutePaths.Home : RoutePaths.Splash,
                  onGenerateRoute: Routers.generateRoute,
                  theme: ThemeData(
                    textTheme: TextTheme(
                        // button: TextStyle(fontSize: 45)
                        ),
                  ),
                );
              })),
    );
  }
}
