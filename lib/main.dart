import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soc_grocery/app/routes/app_pages.dart';
import 'package:soc_grocery/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DependencyInjection.init();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance
        .recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.beVietnamProTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
      ),
    );
  }
}
