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
            AddHospital("Bir Hospital", "RNAC", "+9779866578185"),
            AddHospital("Kantipur Hospital", "Tinkune", "01-4111627"),
            AddHospital("TU teaching Hospital", "Kirtipur", "01-4330346"),
            AddHospital(
                "Civil Teaching Hospital", "New Baneshwor", "01-4107002"),

            // AmbulanceEmergency(),
            // FireEmergency(),
            // Hospitals(),
          ],
        ),
      ),
    );
  }
}
