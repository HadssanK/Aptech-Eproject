import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eproject/Admin/Cities/cities_screen.dart';
import 'package:eproject/Admin/Events/allevents.dart';
import 'package:eproject/Admin/Hotals/hotals.dart';
import 'package:eproject/Admin/Restourent/Myrestourant.dart';
import 'package:eproject/Admin/userdata/fetchuser.dart';
import 'package:eproject/screen_Pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List colors=[Colors.grey,Colors.deepOrangeAccent,Colors.brown,Colors.blueAccent,Colors.deepPurpleAccent];
  int color = 0;
  List User = ["User","Ceties","Hotals","Restourent","Events"];
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.lightGreen,
        child: Column(
          children: [
            ListTile(
              title: Text("sdf"),
              subtitle: Text("sdf"),
            ),
            Spacer(),
           TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
           }, child: Text("Logout"))

          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Dashboad"),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.yellow,
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: Container(
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              width: double.infinity,
              height: 500, // Adjust height as needed
              child:GridView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: User.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => UserFetch()),);
                        } else if (index == 1) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CetiesPage()),);
                        } else if (index == 2) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HotalsPage()),);
                        } else if (index == 3) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RestourentScreen()),);
                        }else if (index == 4) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AllEvents()),);
                        }
                      },
                    child: Container(
                      decoration: BoxDecoration(
                          color: colors[index],
                        borderRadius: BorderRadius.circular(15)
                      ),
                      width: double.infinity,
                      height: 200,
                      child: Center(child: Text(User[index],style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),)),// Set color based on index
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
