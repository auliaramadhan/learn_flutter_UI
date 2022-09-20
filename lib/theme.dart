import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'colors.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.dark(),
  );

  // static final lightTheme = (BuildContext ctx) => ThemeData(
  // ignore: prefer_function_declarations_over_variables
  static final lightTheme = (BuildContext ctx) => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    //  kadang ini ga bisa
    // primaryColor: ColorApp.primary,
    // primarySwatch:ColorApp.primary,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: ColorApp.primary,
      secondary: ColorApp.secondary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(alignment: Alignment.center, textStyle: TextStyle()),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onSurface: ColorApp.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: ColorApp.divider,
        elevation: 4,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(),
    ),
    fontFamily: "Montserrat",
    typography: Typography.material2018(),
    // textTheme: const TextTheme(
    //   bodyText1: TextStyle(debugLabel: 'bodyText1', color: Colors.black54, decoration: TextDecoration.none, fontSize: 12),
    //   bodyText2: TextStyle(debugLabel: 'bodyText2', color: Colors.black54, decoration: TextDecoration.none, fontSize: 14),

    // ),
    // textTheme: TextTheme().copyWith(),
    textTheme: Theme.of(ctx).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.grey,
        ),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 8,
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
