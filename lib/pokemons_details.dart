import 'package:flutter/material.dart';

class PokemonDetails extends StatefulWidget {
   final pokemonDetail;
   final Color color;
   final int tag;

  const PokemonDetails({super.key, required this.pokemonDetail, required this.color, required this.tag});

  @override
  _PokemonDetailsState createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor:widget.color ,
      body: Stack(
        children: [
          Positioned(
              top: height*0.17,
              right: -10,
              child: Image.asset('images/pokeball.png',height: 200,fit: BoxFit.fitWidth,)
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height*0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(30)),color: Colors.white),

            ),
          ),

        ],
        
      ),
    );

  }
}
