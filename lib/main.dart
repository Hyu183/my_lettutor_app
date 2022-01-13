import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_lettutor_app/constants/app_theme.dart';
import 'package:my_lettutor_app/providers/auth_provider.dart';
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
    // authProvider.
  }

//   void loginCallback(int _isLogin) {
//     setState(() {
//       isLogin = _isLogin;
//     });
//   }

//   Widget displayScreen() {
//     if (isLogin == 1) {
//       return TabsPage(callback: loginCallback);
//     } else if (isLogin == 0) {
//       return Login(callback: loginCallback);
//     }
//     return Container();
//   }

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
        return MaterialApp(
          title: 'LetTutor',
          theme: themeProvider.pinkMode ? themeDataPink : themeDataLight,
          home:
              authProvider.isLoggedIn ? TabsPage() : Login(), //displayScreen(),
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


