import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/ui_helper.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';
import 'package:flutter_pokedex_app/services/pokeDex_api.dart';
import 'package:flutter_pokedex_app/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

late Future<List<PokemonModel>> _pokemonList;

class _PokemonListState extends State<PokemonList> {
  @override
  void initState() {
    super.initState();
    _pokemonList = PokiApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _myList = snapshot.data!;
          return GridView.builder(
            itemCount: _myList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: UIHelper.getGridListCrossAxisCount()),
            itemBuilder: (context, index) =>
                PokeListItem(pokemon: _myList[index]),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('error'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
// ListView.builder(
//               itemCount: _myList.length,
//               itemBuilder: (context, index) {
//                 var currentPokemon = _myList[index];
//               });