import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/screen/first_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_api/components/category_models.dart';

import '../api/http_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  String token = '';
  String name = '';
  String email = '';
  List listCategory = [];

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      const key = 'token';
      const key1 = 'name';
      const key2 = 'email';
      final value = pref.get(key);
      final value1 = pref.get(key1);
      final value2 = pref.get(key2);
      token = '$value';
      name = '$value1';
      email = '$value2';
    });
  }

  getKategori() async {
    final response = await HttpHelper().getKategori();
    var dataResponse = jsonDecode(response.body);
    setState(() {
      var listRespon = dataResponse['data'];
      for (var i = 0; i < listRespon.length; i++) {
        listCategory.add(Category.fromJson(listRespon[i]));
      }
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
    getKategori();
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.remove("token");
      preferences.clear();
    });
    final response = await HttpHelper().logout(token);
    print(response.body);
  }

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
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome $name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.logout_sharp,
                        color: Colors.white,
                        size: 29,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const FirstPage();
                            },
                          ),
                        );
                        logOut();
                      },
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
                  topLeft: Radius.circular(10.0),
                  // bottomRight: Radius.circular(10.0),
                  // bottomLeft: Radius.circular(10.0),
                ),
              ),
              child: ListView.builder(
                itemCount: listCategory.length,
                itemBuilder: (context, index) {
                  var kategori = listCategory[index];
                  return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.greenAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.create_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.redAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.deepPurpleAccent,
                            width: 1.5,
                          ),
                          left: BorderSide(
                            color: Colors.deepPurpleAccent,
                            width: 1.5,
                          ),
                          right: BorderSide(
                            color: Colors.deepPurpleAccent,
                            width: 1.5,
                          ),
                          bottom: BorderSide(
                            color: Colors.deepPurpleAccent,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                          kategori.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
