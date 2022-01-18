import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_lettutor_app/constants/app_theme.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:my_lettutor_app/data/__repository.dart';
import 'package:my_lettutor_app/providers/favorite_teachers.dart';
import 'package:my_lettutor_app/providers/language_provider.dart';
import 'package:my_lettutor_app/providers/teachers.dart';
import 'package:my_lettutor_app/providers/theme_provider.dart';
import 'package:my_lettutor_app/routes.dart';
import 'package:provider/provider.dart';

import 'package:my_lettutor_app/ui/authentication/login.dart';
import 'package:my_lettutor_app/ui/tabs_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.black
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//   int isLogin = 0;
  ThemeProvider themeProvider = ThemeProvider();
  LanguageProvider languageProvider = LanguageProvider();
  AuthProvider authProvider = AuthProvider();

  @override
  void initState() {
    // TODO: implement initState
    getCurrentTheme();
    getCurrentLanguage();
    checkIsLoggedIn();
    super.initState();
  }

  void getCurrentTheme() async {
    themeProvider.setTheme = await themeProvider.getCurrentTheme();
  }

  void getCurrentLanguage() async {
    languageProvider.setLanguageCode =
        await languageProvider.getCurrentLanguageCode();
  }

  void checkIsLoggedIn() async {
    authProvider.setIsLoggegIn = await authProvider.checkToken();
    if (authProvider.isLoggedIn) {
      authProvider.loadTokens();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Teachers()),
        ChangeNotifierProvider(create: (_) => FavoriteTeachers()),
        // ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider.value(value: languageProvider),
      ],
      builder: (context, child) {
        final themeProvider = context.watch<ThemeProvider>();
        final languageProvider = context.watch<LanguageProvider>();
        final authProvider = context.watch<AuthProvider>();
        return GetMaterialApp(
          title: 'LetTutor',
          theme: themeProvider.pinkMode ? themeDataPink : themeDataLight,
          home:
              authProvider.isLoggedIn ? TabsPage() : Login(), //displayScreen(),
          builder: EasyLoading.init(),
          routes: Routes.routes,
          onGenerateRoute: (settings) => Routes.onGenerateRoutes(settings),
          locale: Locale(languageProvider.languageCode),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
