import 'package:flutter/material.dart';
import 'package:tas_kagit_makas_app/giris.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taş Kağıt Makas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffF77339)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner:
          false, // debug yazısını kaldırmak için bu satır eklendi
      home: const Giris(),
    );
  }
}
