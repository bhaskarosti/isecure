import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class Safety extends StatefulWidget {
  const Safety({super.key});

  @override
  State<Safety> createState() => _FirstAidState();
}

class _FirstAidState extends State<Safety> {
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
        title: const Text('Safety and Security Tips'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://nepalpolice.gov.np/safety-and-security/safety-and-security-tips/',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onProgress: (url) async {
          controller.runJavascript(
              "document.getElementsByClassName('shortcut-section')[0].style.display='none'");
          controller.runJavascript(
              "document.getElementsByTagName('nav')[0].style.display='none'");
          controller.runJavascript(
              "document.getElementsByClassName('list-quick')[0].style.display='none'");
          controller.runJavascript(
              "document.getElementById('helpButton').style.display='none'");
          controller.runJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
        },
      ),

      // body: WebViewWidget(controller: controller)
    );
  }
}
