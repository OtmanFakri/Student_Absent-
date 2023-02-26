import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../Models/ModelsScreen.dart';
import 'package:get/get.dart';



import 'Abcens.dart';
import 'Profile.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseAuth auth;

  HomeScreen({required this.auth});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FirebaseAuth auths;

  List<modelsScreen> screens = [
    new modelsScreen(
        Title: "Account",
        icon: Icons.account_circle_outlined,
        link: ScreenProfil()),
    new modelsScreen(Title: "absence", icon: Icons.check, link: AbcensScreen()),
    new modelsScreen(
        Title: "Matter",
        icon: Icons.menu_book,
        link: ScreenProfil()),
    new modelsScreen(
        Title: "Students",
        icon: Icons.group,
        link: ScreenProfil()),
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 35,
          left: 10,
          right: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heder(),
            SizedBox(
              height: 20,
            ),
            Username(name: widget.auth),
            SizedBox(
              height: 20,
            ),
            Text("More Features :",
                style: TextStyle(fontSize: 28, color: Colors.white60)),
            Expanded(
              child: services(),
            )
          ],
        ),
      ),
    );
  }

  Heder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Hello",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: "Schyler", fontSize: 45),
        ),
        InkWell(
          onTap: () async {
            widget.auth.signOut();
          },
          child: Icon(
            Icons.logout,
            color: Colors.white60,
            size: 30,
          ),
        )
      ],
    );
  }

  Username({required FirebaseAuth name}) {

    var StudentName =name.currentUser!.displayName;
    name.authStateChanges().listen((event) {
      setState(() {
        StudentName = name.currentUser!.displayName;
      });
    });

    return Text(
      "\t \t \t ${StudentName ?? "Unknown"}",
      textAlign: TextAlign.end,
      style: TextStyle(fontSize: 35),
    );
  }

  services() {
    return GridView.custom(
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 5,
        pattern: [
          WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
          ),
          WovenGridTile(
            1,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate((context, index) {
        return Tile(index: index);
      }, childCount: screens.length),
    );
  }

  Tile({required int index}) {
    IconData ii = screens[index].icon;
    return InkWell(
      onTap: () {
        Get.to(() => screens[index].link);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 112, 0.2),
              offset: Offset(0, 3),
              blurRadius: 10,
            ),
          ],
          color: Color(0xff071425),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(color: Colors.white, size: 45, ii),
            Text(screens[index].Title.toString())
          ],
        ),
      ),
    );
  }
}
