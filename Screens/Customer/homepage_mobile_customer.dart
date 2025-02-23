// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:brooms_n_belans/Components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepagemobilecustomer extends StatefulWidget {
  const Homepagemobilecustomer({super.key});

  @override
  State<Homepagemobilecustomer> createState() => _HomepagemobilecustomerState();
}

class _HomepagemobilecustomerState extends State<Homepagemobilecustomer> {
  urlLauncher(String image, String url) {
    return IconButton(
      icon: SvgPicture.asset(
        image,
        color: Colors.black,
        width: 35.0,
      ),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 88,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/logo_broom.png"),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            AbelCustom(text: "Connect with us", size: 40.0),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                urlLauncher("assets/instagram2.svg",
                    "https://www.instagram.com/sohamk1357/"),
                urlLauncher("assets/twitter.svg", "https://www.twitter.com/"),
                urlLauncher(
                    "assets/github.svg", "https://github.com/SohamKharche/"),
              ],
            ),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 450.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "Frontpageimg.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AbelCustom(
                    text: "Welcome User",
                    size: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                  AbelCustom(
                    text: "How can we",
                    size: 25.0,
                  ),
                  AbelCustom(text: "help you?", size: 25.0),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundIconButton(
                      icon: Icons.one_x_mobiledata,
                      route: '/oneoff',
                      Caption: "Oneoff"),
                  RoundIconButton(
                      icon: CupertinoIcons.infinite,
                      route: '/longterm',
                      Caption: "Long term"),
                ],
              ),
              Image.asset("assets/logo_broom.png")
            ],
          ),
        ),
      ),
    );
  }
}
