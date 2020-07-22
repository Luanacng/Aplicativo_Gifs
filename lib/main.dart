import 'package:ChatDoc/login.dart';
import 'package:ChatDoc/models/usuario_model.dart';
import 'package:ChatDoc/options.dart';
import 'package:ChatDoc/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() async {
  runApp(MyApp());

  //QuerySnapshot : para vários domucumentos de uma coleção
  //DocumentSnapshot : para um documento de uma coleção

  //DocumentSnapshot snapshot= await Firestore.instance.collection('mensagens').document('msg1').get();
  //print(snapshot.data);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UsuarioModel>(
      model: UsuarioModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        home: Login(),
      ),
    );
  }
}
