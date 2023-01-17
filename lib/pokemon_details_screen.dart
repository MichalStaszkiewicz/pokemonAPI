import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/bloc/pokemon_api_bloc.dart';

import 'models/pokemon.dart';

class PokemonDetailsScreen extends StatefulWidget {
  PokemonDetailsScreen({super.key, required this.pokemon});
  Pokemon pokemon;

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  List<Widget> prs(List<String> list) {
    List<Widget> texts = [];

    for (String i in list) {
      texts.add(Text(i));
    }

    return texts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokemon Details"),
        ),
        body: BlocBuilder<PokemonApiBloc, PokemonApiState>(
          builder: (context, state) {
            if (state is PokemonApiDetails) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Pokemon Forms: ",
                      style: TextStyle(fontSize: 25),
                    ),
                    ...prs(state.details.forms),
                    Text("Pokemon Moves: ", style: TextStyle(fontSize: 25)),
                    ...prs(state.details.moves),
                    Text("Pokemon Ability: ", style: TextStyle(fontSize: 25)),
                    ...prs(state.details.ability),
                    Text(
                        "Pokemon Base Experience: ${state.details.baseExperience}",
                        style: TextStyle(fontSize: 25)),
                  ],
                ),
              );
            }
            if (state is PokemonApiInitial) {
              return const Center(
                child: Text("Loading Data"),
              );
            } else {
              return Center(
                child: Text("Something Went wrong"),
              );
            }
          },
        ));
  }
}
