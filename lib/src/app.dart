import 'package:flutter/material.dart';
import 'package:organize_flutter_project/src/views/ui/splash.dart';

class BDonorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
