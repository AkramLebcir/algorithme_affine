import 'package:flutter/material.dart';
import 'Affine.dart';

class Screen6 extends StatefulWidget {
  @override
  _MyScreen6State createState() => new _MyScreen6State();
}

class _MyScreen6State extends State<Screen6> {
  int a;
  int b;
  int a2;
  int b2;
  String msg2 = "";

  List<String> litems = [];

  var affine = Affine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.search),
        label: const Text('Recherche'),
        onPressed: () {
          litems.clear();
          FocusScope.of(context).requestFocus(new FocusNode());
          setState(() {
            litems.clear();
            affine.trouverCle(a, b, a2, b2, "");
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
              "Trouver la cle affine",
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
                decoration: InputDecoration(labelText: "Donner x1"),
                onChanged: (aa) => setState(() {
                  a = int.parse(aa);
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Donner y1"),
                onChanged: (cc) => setState(() {
                  b = int.parse(cc);
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Donner x2"),
                onChanged: (cc) => setState(() {
                  a2 = int.parse(cc);
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Donner y2"),
                onChanged: (cc) => setState(() {
                  b2 = int.parse(cc);
                }),
              ),
            ),
            new Expanded(
                child: new ListView.builder(
                    itemCount: litems.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return Center(
                          child: new Text(
                            litems[Index],
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                            ),
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}
