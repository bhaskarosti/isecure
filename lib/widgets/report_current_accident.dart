import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

// List<String> recipents = ["+9779866578185"];

class ReportCurrentAccident extends StatelessWidget {
  static Future<void> openMap(String location) async {
    // String googleUrl = "sms:+39 348 060 888?body=hello%20there";
    String googleUrl =
        'sms:+9779861607872?body=${Uri.encodeComponent(location)}';
    final Uri _url = Uri.parse(googleUrl);
    try {
      await launchUrl(_url);
    } catch (e) {
      Fluttertoast.showToast(msg: "Something went wrong!");
    }
  }

  void getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Permission not given");
      Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      // print("Current Longitude: " + currentPosition.longitude.toString());
      // print("Current Latitude: " + currentPosition.latitude.toString());
      String location = currentPosition.latitude.toString() +
          "," +
          currentPosition.longitude.toString();
      String Message =
          "An Accident has occured in the following location\n https://www.google.com/maps/search/$location";
      openMap(Message);
      // _sendSMS(Message, recipents);
    }
  }

  // void _sendSMS(String message, List<String> recipents) async {
  //   String _result = await sendSMS(message: message, recipients: recipents)
  //       // ignore: body_might_complete_normally_catch_error
  //       .catchError((onError) {
  //     print(onError);
  //   });
  //   print(_result);
  // }

  const ReportCurrentAccident({super.key});
  ShowModelCurrentLocation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // height: 350,
          height: MediaQuery.of(context).size.height / 1.4,

          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Report Accident on your current location",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Image.asset(
                "assets/ambulance1.png",
                height: 200,
              ),
              ElevatedButton(
                  onPressed: () {
                    getCurrentPosition();
                  },
                  child: Text("Report Current Location")),
            ],
          ),
          // color: Colors.white,
          // child: Card(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ShowModelCurrentLocation(context),
      child: Card(
        //
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.7,
          // height: MediaQuery.of(context).size.height /0.7,
          decoration: BoxDecoration(),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Accident on Current Location",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Report Current Location to Authorities",
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              )),
              ClipRRect(
                  child: Image.asset(
                "assets/currentLocation.png",
                height: 150,
                // width: 200,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
