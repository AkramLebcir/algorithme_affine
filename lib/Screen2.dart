import 'package:flutter/material.dart';
import 'Affine.dart';

class Screen2 extends StatefulWidget {
  @override
  _MyScreen2State createState() => new _MyScreen2State();
}

class _MyScreen2State extends State<Screen2> {
  String msg;
  int a;
  int b;
  String msg2 = "";

  var affine = Affine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.lock_open),
        label: const Text('Decrypter'),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          setState(() {
            msg2 = affine.decript(msg, affine.inversMod(a, 26), b);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Decrypter",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0),
            ),
            IconButton(icon: Icon(null)),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 90.0, 30.0, 0.0),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Taper le message a decrypte",
              ),
              onChanged: (m) => setState(() {
                msg = m;
              }),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Donner a"),
                onChanged: (aa) => setState(() {
                  a = int.parse(aa);
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Donner c"),
                onChanged: (cc) => setState(() {
                  b = int.parse(cc);
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: Text(
                "Message dechiffrer est : ${msg2}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
