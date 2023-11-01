import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatefulWidget {
  static const String routeName = "/Doctor_List";

  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  // ignore: unused_field
  List _allResult = [];
  getAppointment() async {
    var data = await FirebaseFirestore.instance
        .collection('Dentist')
        .orderBy('city')
        .get();

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
  var items = [
    'Approved',
    'Pending',
    'Rejected',
  ];

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
          // actions: [

          //   Column(
          //     children: [
          //       ElevatedButton(
          //         onPressed: () {},
          //         child: DropdownButton(
          //           // Initial Value
          //           value: dropdownvalue,

          //           // Down Arrow Icon
          //           icon: const Icon(Icons.keyboard_arrow_down),

          //           // Array list of items
          //           items: items.map((String items) {
          //             return DropdownMenuItem(
          //               value: items,
          //               child: Text(items),
          //             );
          //           }).toList(),
          //           // After selecting the desired option,it will
          //           // change button value to selected value
          //           onChanged: (String? newValue) {
          //             setState(() {
          //               dropdownvalue = newValue!;
          //             });
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ],
        ),
      ),
      body: SizedBox(
        height: 120,
        child: Expanded(
          child: ListView.builder(
            itemCount: _allResult.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(_allResult[index]['address']),
                  Column(
                    children: [
                      Text(_allResult[index]['name']),
                    ],
                  ),
                  const Text("Photo"),
                  Column(
                    children: [
                      Text(_allResult[index]['pin_code']),
                    ],
                  ),
                  Text(_allResult[index]['rating']),
                  Column(
                    children: [
                      Text(_allResult[index]['specialization']),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
