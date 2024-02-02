import 'package:flutter/material.dart';
import 'package:music_palyer/Controller_Page.dart';
import 'package:provider/provider.dart';

import 'Home_Page.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
      create: (context) => Controller_Class(), child: Home_Page(),
    ),),);
}
