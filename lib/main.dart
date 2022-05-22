import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:yoko_testwork/screens/activities/activities_screen.dart';
import 'common/dependencies/injection_container.dart';
import 'const/colors.dart';
import 'screens/activities/bloc/activity_bloc.dart';
import 'screens/auth/bloc/auth_bloc.dart';
import 'screens/auth/login_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');

  initGetIt();
  runApp(
    // DevicePreview(
    //   builder: (context) => const MyApp(),
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Yoko Test',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primaryColor: kPrimaryBlueColor,
        fontFamily: 'Lato',
        errorColor: kPrimaryRedColor,
      ),
      home: Hive.box('tokens').get("accessToken") != null &&
              Hive.box('tokens').get("accessToken") != ""
          ? BlocProvider(
              create: (context) => ActivityBloc(activityServices: getIt()),
              child: const ActivitiesScreen(),
            )
          : BlocProvider(
              create: (context) => AuthBloc(authServices: getIt()),
              child: const LoginScreen(),
            ),
    );
  }
}
