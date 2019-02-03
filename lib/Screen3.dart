import 'package:flutter/material.dart';
import 'Affine.dart';

class Screen3 extends StatefulWidget {
  @override
  _MyScreen3State createState() => new _MyScreen3State();
}

class _MyScreen3State extends State<Screen3> {
  String msg;
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
          FocusScope.of(context).requestFocus(new FocusNode());
          setState(() {
            litems = affine.brufforce(msg);
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
              "Brut force",
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
