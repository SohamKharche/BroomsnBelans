import 'package:brooms_n_belans/Components.dart';
import 'package:flutter/material.dart';
import 'package:brooms_n_belans/routes.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Abutton(title: "Customer view", route: '/home'),
              Abutton(title: "Service view", route: '/jobs')
            ],
          )
        ],
      ),
    );
  }
}
