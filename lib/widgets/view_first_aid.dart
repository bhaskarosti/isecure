import 'package:flutter/material.dart';
import 'package:isecure/widgets/links/first_aid.dart';
// import 'package:flutter_sms/flutter_sms.dart';

// import 'package:isecure/widgets/maps/markers_page.dart';

// import 'emergencies/list_info.dart';

// List<String> recipents = ["+9779866578185"];

class ViewFirstAid extends StatelessWidget {
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
            context, MaterialPageRoute(builder: (context) => FirstAid()));
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
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "First Aid Instructions",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Instructions for first aid after an incident",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )
                ],
              )),
              ClipRRect(
                  child: Image.asset(
                "assets/firstaid.png",
                height: 250,
                // width: 200,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
