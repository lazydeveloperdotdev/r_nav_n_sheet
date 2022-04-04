import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r_nav_n_sheet_example/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    var white = Colors.white;
    var iconTheme = IconThemeData(color: white);
    var bgColor = const Color(0xff282c38);
    var bgColorLight = const Color(0xff232732);
    var accent = Color(0xff00B4AA);
    var error = Colors.red;

    return MaterialApp(
      title: 'RNavNSheet',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        backgroundColor: white,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        appBarTheme: AppBarTheme(
          iconTheme: iconTheme,
          backgroundColor: bgColorLight,
          elevation: 0.0,
        ),
        iconTheme: iconTheme,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: accent,
          onPrimary: white,
          secondary: accent,
          onSecondary: white,
          error: error,
          onError: white,
          background: bgColor,
          onBackground: white,
          surface: bgColorLight,
          onSurface: white,
        ),
        fontFamily: GoogleFonts.raleway().fontFamily,
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
