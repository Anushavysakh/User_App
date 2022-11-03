import 'package:flutter/material.dart';
import 'package:login_page/HomePage/sidebar_menu_items/add.dart';
import 'package:login_page/HomePage/sidebar_menu_items/archive.dart';
import 'package:login_page/HomePage/sidebar_menu_items/create_new_label.dart';
import 'package:login_page/HomePage/sidebar_menu_items/help_feedback.dart';
import 'package:login_page/HomePage/sidebar_menu_items/notes.dart';
import 'package:login_page/HomePage/sidebar_menu_items/remainders.dart';
import 'package:login_page/HomePage/sidebar_menu_items/trash.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey,
        child: ListView(children: const [
          DrawerHeader(
              child: Text(
            "Google Keep",
            style: TextStyle(fontSize: 32, color: Colors.white),
          )),
          Notes(),SizedBox(height: 30,),
          Remainders(),SizedBox(height: 30,),
          Add(),SizedBox(height: 30,),
          Archive(),SizedBox(height: 30,),
          Trash(),SizedBox(height: 30,),
          Settings(),SizedBox(height: 30,),
          HelpAndFeedback(),SizedBox(height: 30,),
        ]));
  }
}





//IconButton(
// onPressed: () {
// _drawKey.currentState!.openDrawer();
// },
// icon: const Icon(Icons.menu)),
