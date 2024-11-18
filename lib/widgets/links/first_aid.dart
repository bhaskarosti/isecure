import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class FirstAid extends StatefulWidget {
  const FirstAid({super.key});

  @override
  State<FirstAid> createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
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
        title: const Text('First Aid Instructions'),
      ),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl:
            'https://www.nhs.uk/conditions/first-aid/after-an-accident/',
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        onProgress: (url) async {
          controller.runJavascript(
              "document.getElementsByTagName('header')[0].style.display='none'");
          controller.runJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none'");
        },
      ),

      // body: WebViewWidget(controller: controller)
    );
  }
}
