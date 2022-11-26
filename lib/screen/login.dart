// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_api/screen/home.dart';
import '../components/chek_have_account.dart';
import '../screen/registrasi.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  bool _isObscure = true;

  TextEditingController etEmail = TextEditingController();
  TextEditingController etPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'img/ballon.png',
            width: 120,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'LOGIN',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 50,
              color: Colors.purple.shade900,
              shadows: [
                Shadow(
                  color: Colors.purple.shade300,
                  blurRadius: 10,
                  offset: const Offset(4.0, 4.0),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: etEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Icon(
                    Icons.mail,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.purple.shade100,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              controller: etPassword,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Icon(
                    Icons.lock,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple.shade100),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.purple.shade100,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade900,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Home();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Register();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
