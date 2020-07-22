import 'package:ChatDoc/login.dart';
import 'package:ChatDoc/options.dart';
import 'package:ChatDoc/ui/gif_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class Filmes extends StatefulWidget {
  @override
  _FilmesState createState() => _FilmesState();
}

class _FilmesState extends State<Filmes> {
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    //função que faz a requisição da internet
    http.Response response;

    if (_search == null)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=IIMOmq29wlzyTjBo4Tnv4ylTuNn6xoKS&q=filmes&limit=25&offset=25&rating=g&lang=en");
    //retorna os gifs do trending
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=IIMOmq29wlzyTjBo4Tnv4ylTuNn6xoKS&q=$_search&limit=25&offset=$_offset&rating=g&lang=en");
    //retorna o gif da pesquisa
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text(
          'Filmes',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            alignment: Alignment.center,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Options()));
            },
          )
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquise aqui",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
              onSubmitted: (text) {
                setState(() {
                  //set state pra atualizar a tela
                  _search = text;
                  _offset = 0;
                });
              }, //chama quando é clicado o ícone do teclado do celular
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: _getGifs(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200.0,
                        height: 200.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 5.0,
                        ),
                      );
                    default:
                      if (snapshot.hasError)
                        return Container();
                      else
                        return _createGifTable(context, snapshot);
                  }
                }),
          ),
        ],
      ),
    );
  }

  int _getCount(List data) {
    if (_search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Widget _createGifTable(BuildContext, AsyncSnapshot snapshot) {
    return GridView.builder(
        //visualizaçao dos gifs em forma de grade
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //quantos itens pode ter na horizontal
            crossAxisSpacing: 10.0, //espaçamento entre os itens
            mainAxisSpacing: 10.0 //espaçamento da vertical
            ),
        itemCount:
            _getCount(snapshot.data["data"]), //quantidade de gifs na tela
        itemBuilder: (context, index) {
          //retorna um widget em cada item
          if (_search == null ||
              index <
                  snapshot.data["data"]
                      .length) //se nao estiver pesquisando ou nao for o ultimo gif, retorna o gif
            return GestureDetector(
              child: FadeInImage.memoryNetwork(
                //a imagem aparece de forma suave
                placeholder: kTransparentImage,
                image: snapshot.data["data"][index]["images"]["fixed_height"]
                    ["url"],
                height: 300.0,
                fit: BoxFit.cover,
              ),
              onTap: () {
                //muda pra outra tela do GIF
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GifPage(snapshot.data["data"][index])));
              },
              onLongPress: () {
                Share.share(snapshot.data["data"][index]["images"]
                    ["fixed_height"]["url"]);
              },
            );
          else
            return Container(
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 70.0,
                    ),
                    Text(
                      "Carregar mais...",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    )
                  ],
                ),
                onTap: () {
                  setState(() {
                    //atualiza a tela com + 19 gifs
                    _offset += 19;
                  });
                },
              ),
            );
        });
  }
}
