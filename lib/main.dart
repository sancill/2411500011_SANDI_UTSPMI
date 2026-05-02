import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'DashboardPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Activity App',
      debugShowCheckedModeBanner: false,
      // Requirement 7: Mengatur ThemeData sesuai instruksi UTS poin 7.b
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
      },
    );
  }
}
