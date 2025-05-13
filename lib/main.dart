import 'package:flutter/material.dart';
import 'package:practical_taskl_customer_order/screens/orders_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orders Dashboard',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF7F9FB),
        cardColor: Colors.white,
        colorScheme: ColorScheme.light(
          primary: Colors.teal,
          secondary: Colors.greenAccent,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        cardTheme: CardTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
