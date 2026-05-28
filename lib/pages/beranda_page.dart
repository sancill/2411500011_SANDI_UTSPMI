import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  Future<void> logout(BuildContext context) async {
    // menghapus session
    final pref = await SharedPreferences.getInstance();
    await pref.remove('isLogin');

    if (!context.mounted) return;

    // akana dipindahkan ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),

              // title
              const Text(
                'Hallo, \n'
                'Selamat datang, Admin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), // Text

              const SizedBox(height: 79),

              // button login
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () => logout(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFA3C3C),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ), // RoundedRectangleBorder
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ), // TextStyle
                  ), // Text
                ), // ElevatedButton
              ), // SizedBox
            ],
          ), // Column
        ), // Padding
      ), // SafeArea
    ); // Scaffold
  }
}
