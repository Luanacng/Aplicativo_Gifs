import 'package:ChatDoc/cadastro.dart';
import 'package:ChatDoc/models/usuario_model.dart';
import 'package:ChatDoc/options.dart';
import 'package:ChatDoc/ui/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: ScopedModelDescendant<UsuarioModel>(
            builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  //Image.network(
                  // "https://images.vexels.com/media/users/3/200002/isolated/lists/55afc5b50590965e03ff9e389f4afd79-icone-de-traco-de-lupa-rosa.png"),
                  SizedBox(
                    height: 40.0,
                  ),
                  Icon(
                    Icons.feedback,
                    size: 50.0,
                    color: Colors.pink[100],
                  ),
                  Text(
                    'Seja Bem-Vindo! Para buscar gifs faça seu Login.',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(40)),
                      hintText: "E-mail",
                      hintStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w300),
                      icon: Icon(
                        Icons.alternate_email,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido";
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(40)),
                        hintText: "Senha",
                        hintStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300)),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return "Senha inválida";
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        if (_emailController.text.isEmpty) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content:
                                Text("Insira seu e-mail para recuperação!"),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                          ));
                        } else {
                          model.recoverPass(_emailController.text);
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Confira seu e-mail!"),
                              backgroundColor: Colors.blue,
                              duration: Duration(seconds: 2)));
                        }
                      },
                      child: Text(
                        "Esqueci minha senha",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[850],
                            fontStyle: FontStyle.italic),
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(100)),
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Colors.pink[900],
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}

                        model.signIn(
                            email: _emailController.text,
                            pass: _passController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Não possui conta? Cadastre-se.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  FlatButton(
                    child: Text(
                      "Criar Conta",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              Cadastro())); //substitui a página
                    },
                  ),
                ],
              ));
        }));
  }

  void _onSuccess() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Options()));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
