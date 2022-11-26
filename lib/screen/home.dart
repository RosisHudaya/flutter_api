import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String name = 'Huda';
  String email = 'huda02@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple.shade900,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.purple.shade900,
            ),
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome $name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
                        shadows: [
                          Shadow(
                            color: Colors.purple.shade300,
                            blurRadius: 10,
                            offset: const Offset(4.0, 4.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      email,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0)),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        'Hallo Dek',
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
