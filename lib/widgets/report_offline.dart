import 'package:flutter/material.dart';

class ReportOffline extends StatelessWidget {
  const ReportOffline({super.key});
  ShowModelCurrentLocation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // height: 350,
          height: MediaQuery.of(context).size.height / 1.4,

          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Card(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
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
                        "Offline Accident Report",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Report Accident Location to Authorities Using Your Phone's Messaging App",
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                )),
                ClipRRect(
                    child: Image.asset(
                  "assets/offlinelocation.png",
                  height: 150,
                  // width: 200,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
