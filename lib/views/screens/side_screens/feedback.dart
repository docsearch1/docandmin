import 'package:flutter/material.dart';

class FeedBacks extends StatelessWidget {
  static const String routeName = "/FeedBacks";

  const FeedBacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FeedBack Page"),
      ),
      body: const Center(
        child: Text("This page in under maintenence"),
      ),
    );
  }
}
