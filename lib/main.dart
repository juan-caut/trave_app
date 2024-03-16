import 'package:flutter/material.dart';
import 'package:trave_app/pages/detail_page.dart';
import 'package:trave_app/pages/navpages/main_page.dart';
import 'package:trave_app/pages/welcome_page.dart';

import 'package:flutter/rendering.dart';

void main() {
  // Habilitar el modo de depuración de pintura de tamaño para toda la aplicación.
  //debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trave App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: DetailPage(),
    );
  }
}
