import 'package:flutter/material.dart';
import 'ad_helper.dart'; // Import the file where AdHelper class is defined

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdHelper.initialize(); // Initialize the AdHelper

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ad Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AdHelper.getNativeAd(), // Display native ad
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              AdHelper.getInterstitialAd();
            },
                child: Text("Interstitial")),
            SizedBox(height: 20),
            AdHelper.getNativeBannerAd(), // Display native banner ad
          ],
        ),
      ),
    );
  }
}
