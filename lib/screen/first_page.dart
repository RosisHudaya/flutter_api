// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_api/screen/login.dart';
import 'package:flutter_api/screen/registrasi.dart';

import '../components/chek_have_account.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _Firstpage();
}

class _Firstpage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 130,
            child: Image.asset(
              'img/stisla.png',
              height: 180,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70, right: 70),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                },
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
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
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 70, right: 70),
          //   child: SizedBox(
          //     height: 55,
          //     width: double.infinity,
          //     child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.purple.shade50,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(50),
          //         ),
          //       ),
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) {
          //               return const Register();
          //             },
          //           ),
          //         );
          //       },
          //       child: const Text(
          //         "REGISTER",
          //         style: TextStyle(
          //           fontWeight: FontWeight.w400,
          //           fontSize: 23,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
