import 'package:flutter/material.dart';
// import 'package:isecure/widgets/links/first_aid.dart';
// import 'package:isecure/widgets/links/safety.dart';
import 'package:isecure/widgets/links/therapy.dart';
// import 'package:flutter_sms/flutter_sms.dart';

// import 'package:isecure/widgets/maps/markers_page.dart';

// import 'emergencies/list_info.dart';

// List<String> recipents = ["+9779866578185"];

class SeekTherapy extends StatelessWidget {
  // void _sendSMS(String message, List<String> recipents) async {
  //   String _result = await sendSMS(message: message, recipients: recipents)
  //       // ignore: body_might_complete_normally_catch_error
  //       .catchError((onError) {
  //     print(onError);
  //   });
  //   print(_result);
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => ShowModelCurrentLocation(context),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Therapy()));
      },
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
                      "Get Therapy Support",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Talk to a Digital AI Therapist",
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              )),
              ClipRRect(
                  child: Image.asset(
                "assets/therapy.png",
                height: 140,
                // width: 200,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
