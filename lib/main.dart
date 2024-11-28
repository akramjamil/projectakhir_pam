import 'package:flutter/material.dart';
import 'package:projek_akhir/screens/splash_screen.dart'; // Impor SplashScreen
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projek_akhir/models/reservasi.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReservationAdapter());
  await Hive.openBox<Reservation>('reservationsBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
