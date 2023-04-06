import 'package:flutter/material.dart';
import 'package:todoapp_with_provider/view/add_todo_screen.dart';
import 'package:todoapp_with_provider/view/home_screen.dart';
import 'package:todoapp_with_provider/view/login_screen.dart';
import 'package:todoapp_with_provider/view/signup_screen.dart';
import 'package:todoapp_with_provider/view/splash_screen.dart';

import '../streams/stream_example_screen.dart';
class Routes{
 static const String splashScreen = "splashScreen";
 static const String homeScreen = "homeScreen";
 static const String loginScreen = "loginScreen";
 static const String signUpScreen = "signUpScreen";
 static const String addTodoScreen = "addTodoScreen";

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashScreen:  return  MaterialPageRoute(builder: (_)=>const SplashScreen());
      case homeScreen:  return  MaterialPageRoute(builder: (_)=>const HomeScreen());
      case loginScreen:  return  MaterialPageRoute(builder: (_)=>const LoginScreen());
      case signUpScreen:  return  MaterialPageRoute(builder: (_)=>const SignUpScreen());
      case addTodoScreen:  return  MaterialPageRoute(builder: (_)=>const AddTodoScreen());
      default:
        return MaterialPageRoute(builder: (_)=> StreamExample());
        //return _errorRoute();

    }
  }
 static Route<dynamic> _errorRoute() {
   return MaterialPageRoute(builder: (_) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Error'),
       ),
       body: const Center(
         child: Text('ERROR'),
       ),
     );
   });
 }
}



