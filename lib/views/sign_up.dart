import 'package:flutter/material.dart';
import 'package:music/provider/song_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment(10, -2),
                child: Container(
                  height: 390,
                  width: 390,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      color: Color(0xff38B4FE)),
                ),
              ),
              Align(
                alignment: Alignment(-4, -1.6),
                child: Container(
                  height: 360,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(250),
                      color: Color(0xff308EE8)),
                ),
              ),
              Align(
                alignment: Alignment(-4, -1.6),
                child: Container(
                  height: 330,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(250),
                    color: Color(0xff1F6AC7),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.6),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.white),
                  child: FlutterLogo(),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Create",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50),
                    child: TextFormField(
                      controller: username,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.black),
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.mail),
                        hintText: "E-mail",
                        hintStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0, right: 50),
                    child: TextFormField(
                      controller: password,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.black),
                      obscureText:
                          Provider.of<SongProvider>(context).listModel.issecure,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            Provider.of<SongProvider>(context, listen: false)
                                .secure();
                          },
                          child: (Provider.of<SongProvider>(context)
                                  .listModel
                                  .issecure)
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setStringList(
                          'username', [username.text, password.text]);
                      Navigator.of(context).pushNamed('signin');
                    },
                    child: Text("Save"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("You have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'signin');
                          },
                          child: Text("Sign in"))
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
