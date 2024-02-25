import 'dart:io';
import 'package:eproject/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  void login()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text,
          password: userPassword.text);

      SharedPreferences Userdata = await SharedPreferences.getInstance();
      Userdata.setString("email", userEmail.text);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Splash(),));
    } on FirebaseAuthException catch(error){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${error.code.toString()}")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Text("Login",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),),
            SizedBox(height: 20,),
            TextFormField(
              controller: userEmail,
              decoration: InputDecoration(
                hintText: "Enter your Email",
                label: Text("Email"),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.email),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: userPassword,
              decoration: InputDecoration(
                hintText: " enter you password",
                label: Text("Password"),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.key),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: TextButton(onPressed: (){
                  login();
                }, child: Text("Login",style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: HttpHeaders.acceptRangesHeader
                ),))),
            SizedBox(height: 20,),
            
          ],
        ),
      ),
    );
  }
}
