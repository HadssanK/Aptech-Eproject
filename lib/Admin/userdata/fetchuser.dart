import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserFetch extends StatefulWidget {
  const UserFetch({Key? key});

  @override
  State<UserFetch> createState() => _UserFetchState();
}

class _UserFetchState extends State<UserFetch> {
  late TextEditingController _searchController;
  late QuerySnapshot _snapshotData;


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Fetch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {}); // Trigger rebuild on text field change
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("userData").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    _snapshotData = snapshot.data!;
                    return ListView.builder(
                      itemCount: _snapshotData.docs.length,
                      itemBuilder: (context, index) {
                        String userName = _snapshotData.docs[index]["userName"];
                        String userEmail = _snapshotData.docs[index]["userEmail"];
                        // Check if search text is empty or matches user name
                        if (_searchController.text.isEmpty || userName.toLowerCase().contains(_searchController.text.toLowerCase())) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            title: Text(userName),
                            subtitle: Text(userEmail),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // Handle update action
                                    // You can implement update logic here
                                    print("Update action for $userName");
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    FirebaseFirestore.instance.collection("userData").doc().delete();
                                  },
                                ),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox.shrink(); // Hide the item if it doesn't match the search text
                        }
                      },
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
