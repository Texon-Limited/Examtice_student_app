import 'package:flutter/material.dart';

import '../../../resources/AppConfigs.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../resources/styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreens extends StatefulWidget {
  final String? argument;
  const WebViewScreens({Key? key, this.argument}) : super(key: key);

  @override
  State<WebViewScreens> createState() => _WebViewScreensState();
}

class _WebViewScreensState extends State<WebViewScreens>
    with TickerProviderStateMixin {
  bool isLoading = false;

  String url = "https://examtice.com";
  late final WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    setState(() {
      if (widget.argument == "FAQ") {
        url = "https://examtice.com/faq";
      } else if (widget.argument == "NEWS") {
        url = "https://examtice.com/blog";
      }
      else if (widget.argument == "FORUM") {
        url = "https://examtice.com/forum";
      }
      else {}
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onNavigationRequest: (navigation) {
              if (navigation.url != url) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        )
        ..loadRequest(Uri.parse(url));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentTheme.getCurrentTheme() == ThemeMode.dark
          ? Colors.black
          : ColorManager.uiBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Set this height
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            widget.argument.toString(),
            style: getTextStyle(16, FontWeight.w600, Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetConstant.threeCircleIcon)),
              // gradient: LinearGradient(colors: [
              //   HexColor.fromHex("#F0478C"),
              //   HexColor.fromHex("#CC0B5A"),
              // ]),
            ),
          ),
        ),
      ),      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:

            (widget.argument == "About Us")?SingleChildScrollView(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Hello '),
                    TextSpan(
                      text: 'bold',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' world!'),
                  ],
                ),
              ),
            ):
            Stack(
              children: [
                WebViewWidget(controller: controller)
              ],
            )),
      ),
    );
  }
}