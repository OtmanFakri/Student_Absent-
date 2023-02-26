import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:faker/faker.dart';
import 'package:get/get.dart';
import '../Models/test.dart';

class AbcensScreen extends StatefulWidget {
  @override
  State<AbcensScreen> createState() => _AbcensScreenState();
}

class _AbcensScreenState extends State<AbcensScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => _fakedata(),
          child: Icon(Icons.document_scanner),
        ),
        body: Center(
          child: Text(FirebaseAuth.instance.currentUser!.uid.toString()),
        ));
  }

  _fakedata() async {

    var db = FirebaseFirestore.instance;


    var userRef = db.collection('users').doc('user1');
    await userRef.set({
      "name": 'John Smith',
      "email": 'john@example.com',
      "age": 30
    });

// Create a "posts" subcollection within the user document
    var postsCollection = userRef.collection('posts');

// Add a new post document to the "posts" subcollection
    var postRef = postsCollection.doc();
    await postRef.set({
      "title": 'My First Post',
      "content": 'This is the content of my first post.',
      "date_created": "2001-01-20"
    });

  }
}
