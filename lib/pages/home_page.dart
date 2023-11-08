import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/services/pokeDex_api.dart';
import 'package:flutter_pokedex_app/widgets/app_title.dart';
import 'package:flutter_pokedex_app/widgets/pokemon_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    PokiApi.getPokemonData();
    return ScreenUtilInit(
      designSize: const Size(480, 976),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        home: Scaffold(
          body: OrientationBuilder(
            builder: (context, orientation) => Column(
              children: [
                AppTitle(),
                Expanded(child: PokemonList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
