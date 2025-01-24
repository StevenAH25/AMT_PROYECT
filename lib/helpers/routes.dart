import 'package:flutter/material.dart';
import 'package:spt_app/views/bottom_dashboard.dart';
import 'package:spt_app/views/start_screen.dart';
import 'package:spt_app/views/login.dart';
import 'package:spt_app/views/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes(){
    return{
      StartScreen.routname: (context) => const StartScreen(),
      Login.routname: (context) => const Login(),
      HomePage.routname: (context) => const HomePage(),
      BottomDashboard.routname:(context) => const BottomDashboard(),
    };
  }
}