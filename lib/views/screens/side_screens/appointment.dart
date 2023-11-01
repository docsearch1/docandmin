import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  static const String routeName = "/AppointmentScreen";

  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List _allResult = [];
  getAppointment() async {
    var data = await FirebaseFirestore.instance.collection('Dentist').get();

    setState(() {
      _allResult = data.docs;
    });
  }

  @override
  void initState() {
    getAppointment();
    super.initState();
  }

  String dropdownvalue = 'Pending';

  // List of items in our dropdown menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Doctor Id"),
              Text("Doctor Name"),
              Text("Clinic Photo"),
              Text("County "),
              Text("State"),
              Text("City"),
              Text("Status "),
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text("This is Appointment Page"),
      ),
    );
  }
}
