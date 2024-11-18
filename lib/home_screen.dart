import 'package:flutter/material.dart';
import 'package:isecure/widgets/emergency.dart';
import 'package:isecure/widgets/live_safe.dart';
import 'package:isecure/widgets/report_accident_location.dart';
import 'package:isecure/widgets/report_current_accident.dart';
import 'package:isecure/widgets/seek_doctor.dart';
import 'package:isecure/widgets/seek_therapy.dart';
import 'package:isecure/widgets/view_first_aid.dart';
import 'package:isecure/widgets/view_safety.dart';
// import 'package:isecure/widgets/report_offline.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Emergency Contacts",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: [
                  Emergency(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Find Nearby Places",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  LiveSafe(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Report an Accident",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ReportCurrentAccident(),
                  ReportAccidentLocation(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Helpful Instructions",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ViewFirstAid(),
                  ViewSafety(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Experimental Features",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SeekTherapy(),
                  SeekDoctor(),
                  // ReportOffline(),
                ],
              ))
            ],
          ),
        ),
        // Emergency(),
      ),
    );
  }
}
