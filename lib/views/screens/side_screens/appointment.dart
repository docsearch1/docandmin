import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppointmentScreen extends StatefulWidget {
  static const String routeName = "/AppointmentScreen";

  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List _allResult = [];
  getAppointment() async {
    EasyLoading.show(status: "Please Wait...");
    var data = await FirebaseFirestore.instance
        .collection('Appointments')
        .get()
        .whenComplete(() => EasyLoading.dismiss());
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
              Text("date_for_booking"),
              Text("doctorId"),
              Text("fee"),
              Text("mode_of_payment"),
              Text("paid"),
              Text("self"),
              Text("slot"),
              Text("userId")
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: _allResult.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_allResult[index]['date_for_booking']),
                Text(_allResult[index]['doctorId']),
                Text(_allResult[index]['fee']),
                Text(_allResult[index]['mode_of_payment']),
                Text(_allResult[index]['paid'].toString()),
                Text(_allResult[index]['self'].toString()),
                Text(_allResult[index]['slot']),
                Text(_allResult[index]['userId'])
              ],
            );
          }),
    );
  }
}


  // Text(_allResult[index]['date_for_booking']),
  //                   Text(_allResult[index]['doctorId']),
                    // Text(_allResult[index]['fee']),
                    // Text(_allResult[index]['mode_of_payment']),
                    // Text(_allResult[index]['paid']),
                    // Text(_allResult[index]['self']),
                    // Text(_allResult[index]['slot']),
                    // Text(_allResult[index]['timestamp']),
                    // Text(_allResult[index]['userId'])