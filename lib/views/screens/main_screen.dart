import 'package:doc_search_web_admin/views/screens/side_screens/banners.dart';
import 'package:doc_search_web_admin/views/screens/side_screens/commuicatins.dart';
import 'package:doc_search_web_admin/views/screens/side_screens/doctor_list.dart';
import 'package:doc_search_web_admin/views/screens/side_screens/feedback.dart';
import 'package:doc_search_web_admin/views/screens/side_screens/medical_records.dart';
import 'package:doc_search_web_admin/views/screens/side_screens/online_consultation.dart';
import 'package:doc_search_web_admin/views/screens/side_screens/orders.dart';
import 'package:doc_search_web_admin/views/screens/side_screens/refers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import 'side_screens/appointment.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectItem = const AppointmentScreen();

  screenSlector(item) {
    if (item.route == AppointmentScreen.routeName) {
      setState(() {
        _selectItem = const AppointmentScreen();
      });
      return;
    } else if (item.route == Communications.routeName) {
      setState(() {
        _selectItem = const Communications();
      });
      return;
    } else if (item.route == MedicalRecords.routeName) {
      setState(() {
        _selectItem = const MedicalRecords();
      });
      return;
    } else if (item.route == OnlineConsultation.routeName) {
      setState(() {
        _selectItem = const OnlineConsultation();
      });
      return;
    } else if (item.route == DoctorList.routeName) {
      setState(() {
        _selectItem = const DoctorList();
      });
      return;
    } else if (item.route == Refers.routeName) {
      setState(() {
        _selectItem = const Refers();
      });
      return;
    } else if (item.route == FeedBacks.routeName) {
      setState(() {
        _selectItem = const FeedBacks();
      });
      return;
    } else if (item.route == BannersForPatient.routeName) {
      setState(() {
        _selectItem = const BannersForPatient();
      });
    } else if (item.route == Orders.routeName) {
      setState(() {
        _selectItem = const Orders();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: const Color.fromARGB(255, 7, 4, 215),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 209, 231),
        toolbarHeight: 95,
        actions: [
          Column(
            children: [
              Image.asset(
                "assets/icons/doctoricon.png",
                width: 60,
                height: 45,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Doc Search",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Hospital",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Lab Test",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Medicine",
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w400),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Find Doctor",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                ),
              ),
            ],
          )
        ],
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Your Drive',
          ),
          AdminMenuItem(
            icon: Icons.apartment,
            title: 'Appointments',
            route: AppointmentScreen.routeName,
          ),
          AdminMenuItem(
            icon: Icons.comment_rounded,
            title: 'Communications',
            route: Communications.routeName,
          ),
          AdminMenuItem(
            icon: Icons.medical_services,
            title: 'Medical Records',
            route: MedicalRecords.routeName,
          ),
          AdminMenuItem(
            icon: Icons.air_outlined,
            title: 'Online Conssultations',
            route: OnlineConsultation.routeName,
          ),
          AdminMenuItem(
            icon: Icons.add_to_drive,
            title: 'Banners',
            route: BannersForPatient.routeName,
          ),
          AdminMenuItem(
            icon: Icons.calendar_month,
            title: 'Set Time/Day',
            route: '/',
          ),
          AdminMenuItem(
              icon: Icons.home,
              title: 'Doctor List',
              route: DoctorList.routeName),
          AdminMenuItem(
            icon: Icons.person_4_sharp,
            title: 'Refers',
            route: Refers.routeName,
          ),
          AdminMenuItem(
            icon: Icons.settings,
            title: 'Profiles',
            route: '/',
          ),
          AdminMenuItem(
            icon: Icons.feedback,
            title: 'FeedBack',
            route: FeedBacks.routeName,
          ),
          AdminMenuItem(
            icon: Icons.outbound_rounded,
            title: 'Orders',
            route: Orders.routeName,
          ),
          AdminMenuItem(
            icon: Icons.logout,
            title: 'Log Out',
            route: '/',
          ),
        ],
        selectedRoute: '',
        onSelected: (item) {
          screenSlector(item);
        },
      ),
      body: _selectItem,
    );
  }
}
