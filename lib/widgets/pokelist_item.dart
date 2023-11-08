import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/constants/constants.dart';
import 'package:flutter_pokedex_app/constants/ui_helper.dart';
import 'package:flutter_pokedex_app/model/pokemon_model.dart';
import 'package:flutter_pokedex_app/pages/details_page.dart';
import 'package:flutter_pokedex_app/widgets/poke_image_and_bool.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        elevation: 4,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0].toString()),
        child: Padding(
          padding: UIHelper.getDefultEdgeInsets(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name.toString(),
                style: Constants.getPokemonNameTextStyle(),
              ),
              Chip(
                label: Text(
                  pokemon.type![0].toString(),
                  style: Constants.getTypeChipNameTextStyle(),
                ),
              ),
              Expanded(child: PokeImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
