import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class teststore extends StatefulWidget {
  const teststore({super.key});

  @override
  State<teststore> createState() => _teststoreState();
}

class _teststoreState extends State<teststore> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>> (
        stream: db.collection('users').snapshots(),
      builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError){
          return const Center(
            child: Text("error"),
          );
        }
        //olah data
        var _data =snapshot.data!.docs;
        //_data.map((e) => null)
        return ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context,index) {
            return ListTile(
              onLongPress: (){
                //di hapus jika tekan lama


        _data[index].reference.delete().then((value) => 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("data di habus")))
        );

              },
              

              title: Text(_data[index].data()['first']),
              subtitle: Text(_data[index].data()['last']),
              
            ) ;
          },
        );
      },
      ),

            floatingActionButton: FloatingActionButton(
    onPressed: () {

    // Create a new user with a first and last name
final user = <String, dynamic>{
  "first": "Ada",
  "last": "Lovelace",
  "born": 1815
};

// Add a new document with a generated ID
db.collection("users").add(user).then((DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}'));

    },
    child: Icon(Icons.add),backgroundColor: Colors.red,
  ),

    );
  }
}