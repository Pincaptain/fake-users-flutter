import 'package:fake_users/injection.dart';
import 'package:flutter/material.dart';

import 'package:fake_users/routes.dart';
import 'package:fake_users/features/map/presentation/pages/map.dart';
import 'package:injectable/injectable.dart';

void main() {
  setupInjection(Environment.development);
  setupRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Users',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      navigatorKey: sailor.navigatorKey,
      onGenerateRoute: sailor.generator(),
      home: MapPage(),
    );
  }
}