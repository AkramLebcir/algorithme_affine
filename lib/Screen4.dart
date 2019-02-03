import 'package:flutter/material.dart';
import 'Affine.dart';

class Screen4 extends StatefulWidget {
  @override
  _MyScreen4State createState() => new _MyScreen4State();
}

class _MyScreen4State extends State<Screen4> {
  int a;
  int a1;

  var affine = Affine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.search),
        label: const Text('Recherche'),
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          setState(() {
            a1 = affine.inversMod(a, 26);
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
              "La fonction Inverse a-1",
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
              child: Text(
                "a-1 est : ${a1 ?? ""}",
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
