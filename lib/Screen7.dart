import 'package:flutter/material.dart';
import 'Affine.dart';

class Screen7 extends StatefulWidget {
  @override
  _MyScreen7State createState() => new _MyScreen7State();
}

class _MyScreen7State extends State<Screen7> {
  String msg = "";
  String msg2 = "";
  String tabc = "";

  List<String> litems = [];

  var affine = Affine();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.lock_open),
        label: const Text('déchiffrer'),
        onPressed: () {
          litems.clear();
          FocusScope.of(context).requestFocus(new FocusNode());
          setState(() {
            msg2 = affine.dechefrement_sans_cl(msg);
            litems.add("\n");
            litems.add("\n");
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
              "dechefrement sans cle",
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Taper le text"),
                onChanged: (m) => setState(() {
                  msg = m;
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
