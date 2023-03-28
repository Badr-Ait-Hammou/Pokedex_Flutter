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
             var type=pokedex[index]['type'][0];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal:12 ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        bottom:-10,
                        right: -10,
                        child: Image.asset('images/pokeball.png',
                          height:100,
                          fit: BoxFit.fitHeight ,)),

                    Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                          pokedex[index]['name'],
                        style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,
                      ),
                      ),
                    ),

                    Positioned(
                      top: 45,
                      left: 20,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4,bottom: 4),
                          child: Text(
                              type.toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.black12,

                        ),
                      ),
                    ),

                    Positioned(
                        bottom: 5,
                          right: 5,
                          child: CachedNetworkImage(imageUrl: pokedex[index]['img'],height: 100,fit: BoxFit.fitHeight,)),
                  ]
                ),

              ),
            );
          } ,
          ),
           ),
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
