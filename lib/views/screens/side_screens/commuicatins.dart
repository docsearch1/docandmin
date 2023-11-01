import 'package:flutter/material.dart';

class Communications extends StatefulWidget {
  static const String routeName = "/Communications";

  const Communications({super.key});

  @override
  State<Communications> createState() => _CommunicationsState();
}

class _CommunicationsState extends State<Communications> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "This page in under maintenence",
          ),
        ),
      ),
    );
  }
}
