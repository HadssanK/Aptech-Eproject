import 'package:eproject/screen_Pages/description.dart';
import 'package:flutter/material.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List colors=[Colors.grey,Colors.deepOrangeAccent,Colors.brown,Colors.blueAccent];
  int color = 0;
  List User = ["User","Ceties","Hotals","Restourent"];
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.lightGreen,
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
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 150,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Description(),));
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
