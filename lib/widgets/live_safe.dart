import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:isecure/widgets/livesafe/busstationcard.dart';
import 'package:isecure/widgets/livesafe/hospitalcard.dart';
import 'package:isecure/widgets/livesafe/pharmacycard.dart';
import 'package:isecure/widgets/livesafe/policecard.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveSafe extends StatelessWidget {
  const LiveSafe({super.key});
  static Future<void> openMap(String location) async {
    String googleUrl = "https://www.google.com/maps/search/$location";
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            //
            PoliceStationCard(
              onMapFunction: openMap,
            ),
            HospitalCard(
              onMapFunction: openMap,
            ),
            PharmacyCard(
              onMapFunction: openMap,
            ),
            BusStationCard(
              onMapFunction: openMap,
            ),
          ],
        ),
      ),
    );
  }
}
