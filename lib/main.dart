import 'package:flutter/material.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';
import 'Screen6.dart';
//import 'package:firebase_admob/firebase_admob.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Algorithme Affine',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Algorithme Affine Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: 500.0,
            color: Colors.black54,
            child: new Container(
                padding: const EdgeInsets.all(30.0),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: new SingleChildScrollView(
                  child: new Column(children: <Widget>[
                    new Card(
                      child: new Center(
                        child: new FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen1()),
                              );
                            },
                            child: new Text("  Crypter  ")),
                      ),
                    ),
                    new Card(
                      child: new Center(
                        child: new FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen2()),
                              );
                            },
                            child: new Text("Decrypter")),
                      ),
                    ),
                    new Card(
                      child: new Center(
                        child: new FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen3()),
                              );
                            },
                            child: new Text("Brut force")),
                      ),
                    ),
                    new Card(
                      child: new Center(
                        child: new FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen4()),
                              );
                            },
                            child: new Text("la fonction Inverse a-1")),
                      ),
                    ),
                    new Card(
                      child: new Center(
                        child: new FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen5()),
                              );
                            },
                            child: new Text("la fonction  frequency")),
                      ),
                    ),
                    new Card(
                      child: new Center(
                        child: new FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Screen6()),
                              );
                            },
                            child: new Text("trouver la cle affine")),
                      ),
                    ),
//                    new Card(
//                      child: new Center(
//                        child: new FlatButton(
//                            onPressed: () {
//                              Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Screen7()),
//                              );
//                            },
//                            child: new Text("dechefrement affin sans cle")),
//                      ),
//                    ),
                  ]),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
//    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-8512591933405657~4936412935").then((response){
//      myBanner..load()..show(anchorOffset: 25.0,anchorType: AnchorType.top,);
//    });
    return new Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.menu),
        label: const Text('Menu'),
        onPressed: () {
          _modalBottomSheetMenu();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 45.0,
        ),
      ),
      body: Container(
        child: Center(
          child: Icon(Icons.home,color: Colors.black26,size: 100.0,semanticLabel: "Affine",),
        ),
      ),
    );
  }
}

//MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//  keywords: <String>['game', 'pubg'],
//  contentUrl: 'https://flutter.io',
//  birthday: DateTime.now(),
//  childDirected: false,
//  designedForFamilies: false,
//  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
//  testDevices: <String>[], // Android emulators are considered test devices
//);
//
//BannerAd myBanner = BannerAd(
//  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
//  // https://developers.google.com/admob/android/test-ads
//  // https://developers.google.com/admob/ios/test-ads
//  adUnitId: "ca-app-pub-8512591933405657/1564267848",
//  size: AdSize.smartBanner,
//  targetingInfo: targetingInfo,
//  listener: (MobileAdEvent event) {
//    print("BannerAd event is $event");
//  },
//);