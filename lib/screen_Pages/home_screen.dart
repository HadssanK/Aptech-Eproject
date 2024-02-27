import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eproject/screen_Pages/description.dart';
import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  bool _isSearchBarOpened = false;

  TextEditingController _reviewController = TextEditingController();
  double _rating = 0;

  void submitReview() async {
    if (_reviewController.text.isEmpty || _rating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter review and rating")));
      return;
    }

    // Assuming 'reviews' is the collection name in Firestore
    await FirebaseFirestore.instance.collection('reviews').add({
      'review': _reviewController.text,
      'rating': _rating,
      'timestamp': Timestamp.now(),
      // You can add other fields like user ID, attraction ID, etc. as needed
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Review submitted successfully")));
    _reviewController.clear();
    setState(() {
      _rating = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios_new),
                  SizedBox(width: screenWidth * 0.04),
                  Text(
                    "City Information",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 59),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearchBarOpened = !_isSearchBarOpened;

                      });
                    },
                    icon: Icon(Icons.search),
                  ),
                  // SizedBox(width: 10),
                  Icon(Icons.drag_handle),
                ],
              ),
              SizedBox(height: 20),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isSearchBarOpened ? 50 : 0,
                child: Visibility(
                  visible: _isSearchBarOpened,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ),
              Text("Top Cities"),
              // SizedBox(height: 10),
              SingleChildScrollView(
                child: Container(
                  height: 170,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        width: 100,
                        // height: 50,
                        color: Colors.amber,
                      );
                    },
                  ),
                ),
              ),
              Text("ALL Cities"),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Description(),));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 500, // Adjust height as needed
                    child: GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 150,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
              ),
           SizedBox(height: 20,),
              Text("Send Feadback",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),),
              SizedBox(height: 15,),
              TextFormField(
                controller: _reviewController,
                maxLines: null, // Allow multiline input
                decoration: InputDecoration(
                  labelText: 'Review',
                  hintText: 'Enter your review',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text('Rating:', style: TextStyle(fontSize: 16)),
              SizedBox(height: 10),
              Slider(
                value: _rating,
                min: 0,
                max: 5,
                divisions: 5,
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },
                label: _rating.toStringAsFixed(1),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitReview,
                child: Text('Submit Review'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
