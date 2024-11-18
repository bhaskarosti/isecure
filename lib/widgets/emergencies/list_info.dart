import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class ListInfo extends StatefulWidget {
  const ListInfo({super.key});

  @override
  State<ListInfo> createState() => _FirstAidState();
}

class _FirstAidState extends State<ListInfo> {
  // final controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..loadRequest(
  //       Uri.parse("https://www.nhs.uk/conditions/first-aid/after-an-accident/"))
  //   ..setNavigationDelegate(NavigationDelegate(
  //     onPageStarted: (url) {},
  //   ));
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Emergency Contacts'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://nepalpolice.gov.np/stations/emergency-contacts/',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onProgress: (url) async {
          // controller.runJavascript(
          // "document.getElementsByClassName('shortcut-section')[0].style.display='none'");
          controller.runJavascript(
              "document.getElementsByTagName('nav')[0].style.display='none'");
          // controller.runJavascript(
          // "document.getElementsByClassName('embed-responsive')[0].style.display='none'");
          controller.runJavascript(
              "document.getElementsByClassName('list-quick')[0].style.display='none'");
          controller.runJavascript(
              "document.getElementById('helpButton').style.display='none'");
          controller.runJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
          // controller.runJavascript("language_ field.val('en-us');");
        },
      ),

      // body: WebViewWidget(controller: controller)
    );
  }
}
