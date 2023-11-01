import 'package:flutter/material.dart';

class MedicalRecords extends StatelessWidget {
  static const String routeName = "/MedicalRecors";

  const MedicalRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "This  Medical Page Is Avilible soon ",
          ),
        ),
      ),
    );
  }
}
