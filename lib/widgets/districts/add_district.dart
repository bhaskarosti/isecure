import 'package:flutter/material.dart';
import 'package:isecure/widgets/districts/add_hospital.dart';
// import 'package:isecure/widgets/emergencies/policeemergency.dart';
// import 'package:isecure/widgets/emergencies/ambulanceemergency.dart';
// import 'package:isecure/widgets/emergencies/fireemergency.dart';
// import 'package:isecure/widgets/emergencies/hospitals.dart';

class Kathmandu extends StatelessWidget {
  const Kathmandu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            // PoliceEmergency(),
            AddHospital("Bhaktapur Cancer", "location", "contact")
            // AmbulanceEmergency(),
            // FireEmergency(),
            // Hospitals(),
          ],
        ),
      ),
    );
  }
}
