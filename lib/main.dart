import 'dart:async';
import 'package:eproject/Admin/userdata/fetchuser.dart';
import 'package:eproject/firebase_options.dart';
import 'package:eproject/screen_Pages/description.dart';
import 'package:eproject/screen_Pages/home_screen.dart';
import 'package:eproject/screen_Pages/login.dart';
import 'package:eproject/Admin/dashboard.dart';

import 'package:eproject/screen_Pages/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expandable Drawer Menu',
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _RegisterState();
}

class _RegisterState extends State<Splash> {
  Future getuser()async{
    SharedPreferences Userdata = await SharedPreferences.getInstance();
    return Userdata.getString("email");
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser().then((value) {
      if(value!=null){
        Timer(Duration(seconds: 5), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomepage(),));
        });
      }
      else{
        Timer(Duration(seconds: 5), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
        });      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Lottie.asset("images/splash.json"),
        ),
      ),
    );
  }
}
