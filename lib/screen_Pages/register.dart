import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eproject/screen_Pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  void register() async{
    try {
      Map<String, dynamic> uAdd = {
        "userName": userName.text,
        "userEmail": userEmail.text,
        "userPassword": userPassword.text
      };
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail.text,
          password: userPassword.text
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
      await FirebaseFirestore.instance.collection("userData").add(uAdd);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data successfull Added")));
    }
    on FirebaseAuthException catch(error){
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
            Text("Register",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),),
            SizedBox(height: 20,),
            TextFormField(
              controller: userName,
              decoration: InputDecoration(
                hintText: "Enter your Name",
                label: Text("Name"),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: userEmail,
              decoration: InputDecoration(
                hintText: "Enter your Email",
                label: Text("Email"),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(Icons.email),
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
              ),
            ),

            SizedBox(height: 20,),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: TextButton(onPressed: (){
                  register();
                  userPassword.clear();
                  userName.clear();
                  userEmail.clear();
                }, child: Text("Register",style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                ),))),
          ],
        ),
      ),
    );;
  }
}
