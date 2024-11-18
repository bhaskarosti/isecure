import 'package:flutter/material.dart';
import 'package:isecure/widgets/districts/add_hospital.dart';
// import 'package:isecure/widgets/emergencies/policeemergency.dart';
// import 'package:isecure/widgets/emergencies/ambulanceemergency.dart';
// import 'package:isecure/widgets/emergencies/fireemergency.dart';
// import 'package:isecure/widgets/emergencies/hospitals.dart';

class Bhaktapur extends StatelessWidget {
  const Bhaktapur({super.key});

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
            AddHospital(
                "Bhaktapur Cancer Hospital", "Bhaktapur 44800", "01-6611532"),
            AddHospital("Khowpa Hospital", "Chyamhasingha", "01-6610317"),
            AddHospital("BP Eye Hospital", "Madhyapur Thimi", "01-6631705"),
            AddHospital(
                "Siddhi Memorial Hospital", "Madhyapur Thimi", "01-6631705"),
            // AmbulanceEmergency(),
            // FireEmergency(),
            // Hospitals(),
          ],
        ),
      ),
    );
  }
}
