import 'package:flutter/material.dart';
import 'Affine.dart';

class Screen5 extends StatefulWidget {
  @override
  _MyScreen5State createState() => new _MyScreen5State();
}

class _MyScreen5State extends State<Screen5> {
  String msg = "";
  String tabc = "";

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
            litems = affine.frequency(msg);
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
              "La fonction frequency ",
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
