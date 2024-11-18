import 'package:flutter/material.dart';
import 'package:isecure/widgets/emergencies/policeemergency.dart';
import 'package:isecure/widgets/emergencies/ambulanceemergency.dart';
import 'package:isecure/widgets/emergencies/fireemergency.dart';
import 'package:isecure/widgets/emergencies/hospitals.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

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
            PoliceEmergency(),
            AmbulanceEmergency(),
            FireEmergency(),
            Hospitals(),
          ],
        ),
      ),
    );
  }
}
