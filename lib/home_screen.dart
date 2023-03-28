import 'dart:convert';

import 'package:badr_pokedex/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 // List pokedex;
  var pokemonapi="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List pokedex;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){// if the value is true the view is compleatly mounted
      fetchPokemonData();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Expanded(child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
          ),itemCount: pokedex.length,
          itemBuilder:(context,index){
            return Card(
              color: Colors.teal,
              child: Stack(
                children: [
                  Positioned(
                      bottom:-10,
                      right: -10,
                      child: Image.asset('images/pokeball.png',height:100,fit: BoxFit.fitHeight ,)),
                  Positioned(
                    top: 30,
                    left: 20,
                    child: Text(
                        pokedex[index]['name']
                    ),
                  ),
                    
                    Positioned(
                      bottom: 5,
                        right: 5,
                        child: CachedNetworkImage(imageUrl: pokedex[index]['img'])),
                ]
              ),

            );
          } ,
          ),
           ), const Center(
             child: CircularProgressIndicator(),
           )
        ],
      )
    );
  }
  void fetchPokemonData(){
    var url = Uri.https('raw.githubusercontent.com', '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if(value.statusCode==200){
        var decodedJsonData=jsonDecode(value.body);
        // print(decodedJsonData);
        pokedex=decodedJsonData['pokemon'];
        print(pokedex[0]['name']);
        setState(() {

        });

      }

    });

  }
}
