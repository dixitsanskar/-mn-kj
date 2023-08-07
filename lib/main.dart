import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dixit Sanskar',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home:  Home() ,
      theme: ThemeData.dark(
      ),
      builder: (context, Widget) => ResponsiveBreakpoints.builder(
       child: ClampingScrollWrapper.builder(context, Widget!),
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        ]
      ) ,
      
    );
  }
}

