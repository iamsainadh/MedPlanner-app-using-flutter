import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medication_remainder/db/db_helper.dart';
import 'package:medication_remainder/pharamacyMap/providers/info_window_provider.dart';
import 'package:medication_remainder/pharamacyMap/providers/map_provider.dart';
import 'package:medication_remainder/screens/bottomnavigator.dart';
import 'package:medication_remainder/screens/mobile_number.dart';
import 'package:medication_remainder/screens/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
String? userName;
String? mobileNumber;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  userName = prefs.getString('userName');
  mobileNumber = prefs.getString('mobileNumber');
  await DBHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => MapProvider()),
        ListenableProvider(create: (_) => InfoWindowProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
        routes: {
          '/': (context) => mobileNumber == null || userName == null
              ? const MobileNumber()
              : const BottomNavi(),
          "first": (context) => const OnboardingScreen(),
        },
      ),
    );
  }
}
