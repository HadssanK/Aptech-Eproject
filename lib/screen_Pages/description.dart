import 'package:carousel_slider/carousel_slider.dart';
import 'package:eproject/screen_Pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int currentIndex = 0;
  List<IconData> icons = [
    Icons.description_outlined,
    Icons.restaurant_menu_rounded,
    Icons.hotel_sharp,
    Icons.event,
  ];
  List tabs = ["Description","Restourant", "Hotal", "event"];
  List slider = [
    Colors.red,
    Colors.green,
      Colors.amber,
    // 'images/b1.jpg',
    // 'images/b2.jpg',
    // 'images/b3.jpg',
    // 'images/b4.jpg',
    // 'images/5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20,),
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomepage(),));
              }, icon: Icon(Icons.arrow_back),),
              CarouselSlider(
                options: CarouselOptions(
                  // height: 500,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: slider.map((i) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        width: 600,
                        // margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: i,
                        ),
                      );
                    },
                  );
                },).toList(),
              ),

          SizedBox(height: 15,),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ListView.builder(
                        itemCount: tabs.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              curve: Curves.bounceIn,
                              duration: const Duration(milliseconds: 500),
                              width: 150,
                              height: 30,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: currentIndex == index?Colors.grey.shade400 : null,
                                  border: currentIndex == index?null:Border.all(color: Colors.black)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    icons[index], // Use icons list to get respective icon for the tab
                                    color: currentIndex == index ? Colors.white : Colors.black,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    tabs[index],
                                    style: TextStyle(color: currentIndex == index ? Colors.white : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12,),
              Text("Opening Time : 8:00AM to 5:00PM"),
              const Text(
                ' rating :',style:TextStyle(
                fontFamily: AutofillHints.countryCode,
                fontWeight: FontWeight.bold
              ),
              ),
              RatingBarIndicator(
                  rating: 2.5,
                  itemCount: 5,
                  itemSize: 30.0,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )),

              SizedBox(height: 10,),
              Text("Description",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: AutofillHints.countryCode,

              ),),
              SizedBox(height: 5,),
              Container(
                width: 80,
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              Container(
                width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                  child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum,."))
            ],
          ),
        ),
      ),
      );
  }
}
