import 'package:almubarok_present/firebase_options.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/routes/page_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Inisialisasi plugin notifikasi
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: ColorApp.colorPrimary,
            ),
            textSelectionTheme: TextSelectionThemeData(
              selectionHandleColor: ColorApp.colorPrimary,
            ),
            expansionTileTheme: ExpansionTileThemeData(
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
              iconColor: ColorApp.black,
              collapsedIconColor: ColorApp.black,
              textColor: ColorApp.black,
              collapsedTextColor: ColorApp.black,
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: BorderSide.none,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: BorderSide.none,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: PageName.splash,
          getPages: PageRoutes.pages,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
          ],
        );
      },
    );
  }
}
