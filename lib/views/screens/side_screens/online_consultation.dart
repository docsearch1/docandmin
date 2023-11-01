import 'package:flutter/material.dart';

class OnlineConsultation extends StatelessWidget {
  static const String routeName = "/OnlineConsultation";

  const OnlineConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "This Reffers OnlineConsultation uploaded soon",
          ),
        ),
      ),
    );
  }
}
