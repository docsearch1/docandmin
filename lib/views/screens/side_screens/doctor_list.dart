import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DoctorList extends StatefulWidget {
  static const String routeName = "/Doctor_List";

  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  // ignore: unused_field
  List _allResult = [];
  getDoctorList() async {
    EasyLoading.show(status: "Please wait a Moments...");
    var data = await FirebaseFirestore.instance
        .collection('doctors')
        .orderBy('cityName')
        .get()
        .whenComplete(() => EasyLoading.dismiss());

    setState(() {
      _allResult = data.docs;
    });
  }

  @override
  void initState() {
    getDoctorList();
    super.initState();
  }

  String dropdownvalue = 'Pending';

  // List of items in our dropdown menu
  var items = [
    'Approved',
    'Pending',
    'Rejected',
  ];

  String approval = 'false';
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
        height: double.infinity,
        child: Expanded(
          child: ListView.builder(
            itemCount: _allResult.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(_allResult[index]['doctorId']),
                  Column(
                    children: [
                      Text(_allResult[index]['doctorName']),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.network(
                      _allResult[index]['clinicImage'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Text(_allResult[index]['countryName']),
                    ],
                  ),
                  Text(_allResult[index]['stateName']),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          approval = 'true';
                          var collection =
                              FirebaseFirestore.instance.collection('doctors');
                          collection
                              .doc(_allResult[index][
                                  'doctorId']) // <-- Doc ID where data should be updated.
                              .update(
                            {
                              "approval": approval,
                            },
                          ) // <-- Updated data
                              .then((_) {
                            if (approval == 'true') {
                              setState(() {
                                approval = 'true';
                              });
                            } else {
                              setState(() {
                                approval = 'false';
                              });
                            }
                            return approval;
                          }).catchError((e) {
                            // ignore: invalid_return_type_for_catch_error
                            return Text(e.toString());
                          });
                        },
                        child: approval == 'true'
                            ? const Text("Approved")
                            : const Text("Pending"),
                      )
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
