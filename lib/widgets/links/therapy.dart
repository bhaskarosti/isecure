import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class Therapy extends StatefulWidget {
  const Therapy({super.key});

  @override
  State<Therapy> createState() => _FirstAidState();
}

class _FirstAidState extends State<Therapy> {
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
        title: const Text('Therapy Support AI'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://poe.com/TherapySupport',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
      ),

      // body: WebViewWidget(controller: controller)
    );
  }
}
