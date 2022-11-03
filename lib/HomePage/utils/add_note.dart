import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {

  String? titles;
  String? des ;

  void add() async {
    // log(FirebaseAuth.instance.currentUser!.uid);
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

    var data = {
      'title': titles,
      'contents': des,
     // 'created': DateTime.now(),
    };

    ref.add(data);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          ElevatedButton(
              onPressed: add,
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ))
        ]),
        body: Form(
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Title'),
              onChanged: (val) {
                titles = val ;
              },
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextFormField(
                  maxLines: null,
                  expands: true,
                  decoration: const InputDecoration(hintText: 'Notes'),
                  onChanged: (val) {
                    des = val ;
                  },
                ),
              ),
            ),
          ]),
        ));
  }
}
