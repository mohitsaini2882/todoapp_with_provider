import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp_with_provider/utils/common_strings.dart';

import 'utils/routes.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.blue.withOpacity(0.7), // Color for Android
        statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: UtilStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.signUpScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}


