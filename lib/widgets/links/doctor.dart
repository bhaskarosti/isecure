import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _FirstAidState();
}

class _FirstAidState extends State<Doctor> {
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
        title: const Text('Digital Doctor AI'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://poe.com/Medical_Doctor',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),

      // body: WebViewWidget(controller: controller)
    );
  }
}
