import 'package:flutter/material.dart';
import 'package:isecure/widgets/districts/add_hospital.dart';
// import 'package:isecure/widgets/emergencies/policeemergency.dart';
// import 'package:isecure/widgets/emergencies/ambulanceemergency.dart';
// import 'package:isecure/widgets/emergencies/fireemergency.dart';
// import 'package:isecure/widgets/emergencies/hospitals.dart';

class Lalitpur extends StatelessWidget {
  const Lalitpur({super.key});

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
            AddHospital("Patan Hospital", "Lagankhel", "01-5522295"),
            AddHospital("Alka Hospital", "Jawalakhel", "01-5970795"),
            AddHospital("Jumeru City Hospital", "DamkalChowk", "01-5444444"),
            AddHospital("B&B Hospital", "Gwarko", "01-5970999"),

            // AmbulanceEmergency(),
            // FireEmergency(),
            // Hospitals(),
          ],
        ),
      ),
    );
  }
}
