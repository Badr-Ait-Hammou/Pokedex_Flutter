import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokemonapi="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List pokedex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:ElevatedButton(
          child: Text('press Button'),
          onPressed: (){
            fetchPokemonData();
          },
        ),
      ),
    );
  }
  void fetchPokemonData(){
    var url = Uri.https('raw.githubusercontent.com', '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      var decodedJsonData=jsonDecode(value.body);
     // print(decodedJsonData);
      pokedex=decodedJsonData['pokemon'];
      print(pokedex);
    });

  }
}
