import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'beranda_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();

    if (usernameController.text == 'Sandi' &&
        passwordController.text == '12345') {
      await prefs.setBool('isLogin', true);
      await prefs.setString('username', usernameController.text);

      if (!context.mounted) return;

      // pindah ke halaman beranda
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BerandaPage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login Gagal")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 100),

              // title
              const Text(
                'Login Page',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), // Text

              const SizedBox(height: 100),

              // username
              SizedBox(
                height: 44,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "Masukan username",
                    hintStyle: const TextStyle(
                      color: Color(0xAAAAAAAA),
                      fontSize: 16,
                    ), // TextStyle

                    contentPadding: const EdgeInsets.symmetric(horizontal: 14),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xAAAAAAAA)),
                    ), // OutlineInputBorder

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                    ), // OutlineInputBorder
                  ), // InputDecoration
                ), // TextField
              ), // SizedBox

              const SizedBox(height: 20),

              // password
              SizedBox(
                height: 44,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Masukan password",
                    hintStyle: const TextStyle(
                      color: Color(0xAAAAAAAA),
                      fontSize: 16,
                    ), // TextStyle

                    contentPadding: const EdgeInsets.symmetric(horizontal: 14),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xAAAAAAAA)),
                    ), // OutlineInputBorder

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF000000)),
                    ), // OutlineInputBorder
                  ), // InputDecoration
                ), // TextField
              ), // SizedBox

              const SizedBox(height: 20),

              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                onChanged: (value) {},
                title: const Text("Remember me"),
              ), // CheckboxListTile

              const SizedBox(height: 20),

              // button login
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4444FF),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ), // RoundedRectangleBorder
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ), // TextStyle
                  ), // Text
                ), // ElevatedButton
              ), // SizedBox
            ],
          ), // Column
        ), // Padding
      ),
    );
  }
}
