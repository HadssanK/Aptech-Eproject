import 'package:flutter/material.dart';

class HotalsPage extends StatefulWidget {
  @override
  _HotelFormPageState createState() => _HotelFormPageState();
}

class _HotelFormPageState extends State<HotalsPage> {
  String _name = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Hotals Info')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle image insertion here
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter hotel name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'City',
                hintText: 'Enter City name',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),

            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter hotel description',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allows for multiline input
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle form submission here
                print('Name: $_name');
                print('Description: $_description');
                // Add code to submit data to backend or perform any other action
              },
              child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
