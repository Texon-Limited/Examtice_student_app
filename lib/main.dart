import 'package:examtice_teacher/splash/bindings/splash_screen_bindings.dart';
import 'package:examtice_teacher/resources/AppConfigs.dart';
import 'package:examtice_teacher/routes/app_pages.dart';
import 'package:examtice_teacher/routes/app_routes.dart';
import 'package:examtice_teacher/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Examtice Teacher App',
      debugShowCheckedModeBanner: false,
      themeMode: currentTheme.getCurrentTheme(),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialBinding: SplashScreenBinding(),
      home: SplashScreen(),
      getPages: AppPages.pages,
    );
  }
}

class MyTheme extends GetxController {
  final _isDark = true.obs;
  get themeValue => _isDark;

  ThemeMode getCurrentTheme() {
    return _isDark.value ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark.value = !_isDark.value;

    update();
    if (themeValue == true) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}
