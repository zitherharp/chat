import 'package:flutter/material.dart';

import 'pages/main_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
    ),
  );
}
