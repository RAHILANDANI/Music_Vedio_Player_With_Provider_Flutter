import 'package:flutter/material.dart';
import 'package:music/provider/song_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    datalist = prefs.getStringList('username')!;
  }

  List<String> datalist = [];
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
                      if (datalist[0] == username.text &&
                          datalist[1] == password.text) {
                        Navigator.pushReplacementNamed(context, '/');
                        prefs.setBool('issignin', true);
                      } else {
                        print("ERRORRRRRR");
                        print(datalist);
                      }
                    },
                    child: Text("Save"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have Account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'signup');
                        },
                        child: Text("Sign Up"),
                      )
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
