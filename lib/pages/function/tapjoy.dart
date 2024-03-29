import 'package:flutter/material.dart';
// import 'package:tap_joy_plugin/tap_joy_plugin.dart';

class TapjoyPage extends StatefulWidget {
  TapjoyPage({Key key}) : super(key: key);

  @override
  _TapjoyPageState createState() => _TapjoyPageState();
}

class _TapjoyPageState extends State<TapjoyPage> {
  // TJPlacement myPlacement = TJPlacement(name: "revolutionTest");
  // TJPlacement myPlacement2 = TJPlacement(name: "Placement02");
  // String contentStateText = "";
  // String connectionState = "";
  // String iOSATTAuthResult = "";
  // String balance = "";
  @override
  void initState() {
    super.initState();
    // set connection result handler
    // TapJoyPlugin.shared.setConnectionResultHandler(_connectionResultHandler());
    // // connect to TapJoy, all fields are required.
    // TapJoyPlugin.shared.connect(
    //     androidApiKey:
    //         "Lo7_xt5tRrO_3tF4fQhELwECslN4XWG2trhdLMR23FrdmsSd6m11G0UZxDIn",
    //     iOSApiKey:
    //         "pYuSLc0wStiCqohMXUUGtQEBwnXkAfMD1Hyg21FTcPsZcMdIeaVN8Vgfs29a",
    //     debug: true);
    // // set userID
    // TapJoyPlugin.shared.setUserID(userID: "user_id123");
    // // set contentState handler for each placement
    // myPlacement.setHandler(_placementHandler());
    // myPlacement2.setHandler(_placementHandler());
    // // add placements.
    // TapJoyPlugin.shared.addPlacement(myPlacement);
    // TapJoyPlugin.shared.addPlacement(myPlacement2);
    // // set currency Handlers
    // TapJoyPlugin.shared.setGetCurrencyBalanceHandler(_currencyHandler());
    // TapJoyPlugin.shared.setAwardCurrencyHandler(_currencyHandler());
    // TapJoyPlugin.shared.setSpendCurrencyHandler(_currencyHandler());
    // TapJoyPlugin.shared.setEarnedCurrencyAlertHandler(_currencyHandler());
  }

// currency handler
  // TJSpendCurrencyHandler _currencyHandler() {
  //   TJSpendCurrencyHandler handler = (currencyName, amount, error) {
  //     setState(() {
  //       balance = "Currency Name: " +
  //           currencyName.toString() +
  //           " Amount:  " +
  //           amount.toString() +
  //           " Error:" +
  //           error.toString();
  //     });
  //   };
  //   return handler;
  // }

  // // connection result handler
  // TJConnectionResultHandler _connectionResultHandler() {
  //   TJConnectionResultHandler handler = (result) {
  //     switch (result) {
  //       case TJConnectionResult.connected:
  //         // TODO: Handle this case.
  //         setState(() {
  //           connectionState = "Connected";
  //         });
  //         break;
  //       case TJConnectionResult.disconnected:
  //         // TODO: Handle this case.
  //         setState(() {
  //           connectionState = "Disconnected";
  //         });
  //         break;
  //     }
  //   };
  //   return handler;
  // }

  // placement Handler
  // TJPlacementHandler _placementHandler() {
  //   TJPlacementHandler handler = (contentState, name, error) {
  //     switch (contentState) {
  //       case TJContentState.contentReady:
  //         setState(() {
  //           contentStateText = "Content Ready for placement :  $name";
  //         });
  //         break;
  //       case TJContentState.contentDidAppear:
  //         setState(() {
  //           contentStateText = "Content Did Appear for placement :  $name";
  //         });
  //         break;
  //       case TJContentState.contentDidDisappear:
  //         setState(() {
  //           contentStateText = "Content Did Disappear for placement :  $name";
  //         });
  //         break;
  //       case TJContentState.contentRequestSuccess:
  //         setState(() {
  //           contentStateText = "Content Request Success for placement :  $name";
  //         });
  //         break;
  //       case TJContentState.contentRequestFail:
  //         setState(() {
  //           contentStateText =
  //               "Content Request Fail + $error for placement :  $name";
  //         });
  //         break;
  //       case TJContentState.userClickedAndroidOnly:
  //         setState(() {
  //           contentStateText = "Content User Clicked for placement :  $name";
  //         });
  //         break;
  //     }
  //   };
  //   return handler;
  // }

  // get App Tracking Authentication . iOS ONLY
  // Future<String> getAuth() async {
  //   TapJoyPlugin.shared.getIOSATTAuth().then((value) {
  //     switch (value) {
  //       case IOSATTAuthResult.notDetermined:
  //         setState(() {
  //           iOSATTAuthResult = "Not Determined";
  //         });
  //         break;
  //       case IOSATTAuthResult.restricted:
  //         setState(() {
  //           iOSATTAuthResult = "Restricted ";
  //         });
  //         break;
  //       case IOSATTAuthResult.denied:
  //         setState(() {
  //           iOSATTAuthResult = "Denied ";
  //         });
  //         break;
  //       case IOSATTAuthResult.authorized:
  //         setState(() {
  //           iOSATTAuthResult = "Authorized ";
  //         });
  //         break;
  //       case IOSATTAuthResult.none:
  //         setState(() {
  //           iOSATTAuthResult = "Error ";
  //         });
  //         break;
  //       case IOSATTAuthResult.iOSVersionNotSupported:
  //         setState(() {
  //           iOSATTAuthResult = "IOS Version Not Supported ";
  //         });
  //         break;
  //       case IOSATTAuthResult.android:
  //         setState(() {
  //           iOSATTAuthResult = "on Android";
  //         });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          children: [
            Text(
              'TabJoy and Video player Setting Conflict in Podfile "use framework!"',
            )
            // Text("Connection State : $connectionState"),
            // ElevatedButton(
            //   child: Text("get iOS App Tracking Auth"),
            //   onPressed: getAuth,
            // ),
            // Text("IOS Auth Result : $iOSATTAuthResult"),
            // ElevatedButton(
            //   child: Text("request content for Placement 001"),
            //   onPressed: myPlacement.requestContent,
            // ),
            // ElevatedButton(
            //   child: Text("request content for Placement 002"),
            //   onPressed: myPlacement2.requestContent,
            // ),
            // Text("Content State : $contentStateText"),
            // ElevatedButton(
            //   child: Text("show Placement 001"),
            //   onPressed: myPlacement.showPlacement,
            // ),
            // ElevatedButton(
            //   child: Text("show Placement 002"),
            //   onPressed: myPlacement2.showPlacement,
            // ),
            // ElevatedButton(
            //   child: Text("get balance"),
            //   onPressed: TapJoyPlugin.shared.getCurrencyBalance,
            // ),
            // ElevatedButton(
            //   child: Text("award balance"),
            //   onPressed: () {
            //     TapJoyPlugin.shared.awardCurrency(15);
            //   },
            // ),
            // ElevatedButton(
            //   child: Text("spend balance"),
            //   onPressed: () {
            //     TapJoyPlugin.shared.spendCurrency(5);
            //   },
            // ),
            // Text("Balance Response : $balance"),
          ],
        ),
      ),
    );
  }
}
