import 'package:advance_exam_flutter/provider/qouteproivder.dart';
import 'package:advance_exam_flutter/view/homepage.dart';
import 'package:advance_exam_flutter/view/likepage.dart';
import 'package:advance_exam_flutter/view/spash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => QuotesProvider(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => Splash(),
            "home": (context) => HomePage(),
            "like": (context) => LikedQuotesPage(),
          },
        );
      },
    ),
  ]));
  //     MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       routes: {
  //         "/": (context) => Splash(),
  //         "home": (context) => HomePage(),
  //         "like": (context) => LikePage(),
  //       },
  //     ),
  //);
}
