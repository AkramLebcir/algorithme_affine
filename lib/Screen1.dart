import 'package:flutter/material.dart';
import 'Affine.dart';

class Screen1 extends StatefulWidget {
  @override
  _MyScreen1State createState() => new _MyScreen1State();
}

class _MyScreen1State extends State<Screen1> {
  String msg;
  int a;
  int c;
  String msg2 = "";

  var affine = new Affine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.lock_outline),
        label: const Text('Crypter'),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          setState(() {
            msg2 = affine.crypt(msg, a, c);
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
              "Crypter",
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
                labelText: "Taper le message a crypte",
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
                  c = int.parse(cc);
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: Text(
                "Message chiffrer est : ${msg2}",
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
