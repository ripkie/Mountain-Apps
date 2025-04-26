import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Tambahkan impor Lottie
import 'package:flutter/material.dart';
import 'pages/gunung_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Gunung Indonesia',
      theme: ThemeData(primarySwatch: Colors.green),
      home: GunungListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
