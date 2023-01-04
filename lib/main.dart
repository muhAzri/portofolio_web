import 'package:flutter/material.dart';
import 'package:portofolio_web/pages/main_page.dart';

import 'pages/main_mobile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth > 600) {
      // Use the web design
      return MainPage();
    } else {
      // Use the mobile design
      return const MainMobilePage();
    }
  },
)
    );
  }
}
