import 'package:ChatDoc/login.dart';
import 'package:ChatDoc/ui/animais.dart';
import 'package:ChatDoc/ui/esportes.dart';
import 'package:ChatDoc/ui/filmes.dart';
import 'package:ChatDoc/ui/food.dart';
import 'package:ChatDoc/ui/home_page.dart';
import 'package:ChatDoc/ui/series.dart';
import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            IconButton(
              alignment: Alignment.center,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            Icon(
              Icons.ac_unit,
              size: 40.0,
              color: Colors.red[100],
            ),
            Text(
              'CATEGORIAS',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.red[200])),
                child: Text(
                  "TRENDINGS",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.red[200])),
                child: Text(
                  "ESPORTES",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Esportes()));
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.red[200])),
                child: Text(
                  "FILMES",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Filmes()));
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.red[200])),
                child: Text(
                  "SÉRIES",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Series()));
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.red[200])),
                child: Text(
                  "ANIMAIS",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Animais()));
                },
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 44.0,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                    side: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: Colors.red[200])),
                child: Text(
                  "FOOD",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Food()));
                },
              ),
            ),
          ],
        ));
  }
}
