import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page/HomePage/utils/view_note.dart';
import 'package:login_page/HomePage/sidebar_menu_items/side_menubar.dart';
import 'package:login_page/HomePage/utils/add_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> myColors = [
    Colors.orange.shade200,
    Colors.red.shade200,
    Colors.green.shade200,
    Colors.deepPurple.shade200,
    Colors.purple.shade200,
    Colors.cyan.shade200,
    Colors.teal.shade200,
    Colors.tealAccent.shade200,
    Colors.pink.shade200,
  ];
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final GlobalKey<ScaffoldState> _drawKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: true,
        key: _drawKey,
        drawer: const SideBarMenu(),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(40)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        _drawKey.currentState!.openDrawer();
                      },
                      icon: const Icon(Icons.menu)),
                  SizedBox(
                    height: 55,
                    width: 150,
// )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Search your notes',
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.grid_view_outlined,
                                size: 25,
                              )),
                          IconButton(
                              onPressed: signOut,
                              icon: const Icon(
                                Icons.logout,
                                size: 25,
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<QuerySnapshot>(
              future: ref.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text("You have no notes"),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      Random random = Random();
                      Color bg = myColors[random.nextInt(4)];
                      Map? data = snapshot.data?.docs[index].data() as Map;
                      // DateTime myDateTime = DateTime.parse(data['created']);
                      // String formattedTime =
                      //     DateFormat.yMMMd().add_jm().format(myDateTime);
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(
                            builder: (context) => ViewNote(
                                data: data,
                                ref: snapshot.data!.docs[index].reference),
                          ))
                              .then((value) {
                            setState(() {});
                          });
                        },
                        child: Card(
                            margin: const EdgeInsets.all(22),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            color: bg,
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Column(
                                children: [
                                  Text(
                                    "${data['title']}",
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  // Container(
                                  //     alignment: Alignment.centerRight,
                                  //     child: Text(
                                  //       //formattedTime,
                                  //       style: const TextStyle(
                                  //           fontSize: 20,
                                  //           color: Colors.black87),
                                  //     ))
                                ],
                              ),
                            )),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text("Loading"),
                  );
                }
              },
            ),
          ]),
        ),
        //
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => const AddNewNote(),
            ))
                .then(
              (value) {
                print("Calling Set State!");
                setState(() {});
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
