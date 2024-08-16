import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:menu_application/sreens/home_page.dart';
import 'package:provider/provider.dart';

import 'main_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// await EasyLocalization.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
      Locale('ru', 'RU'),
      Locale('uz', 'UZ'),
    ],
    path: 'assets/translation',
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
          fontFamily: 'Manrope',
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          colorScheme: ColorScheme.light(primary: Color(0xff2A5270))),
      home: HomePage(),
    );
  }
}
