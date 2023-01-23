import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/presentation_layer/bloc/pokemon_api_bloc.dart';

import 'package:pokeapi/presentation_layer/pages/pokemon_details_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Pokemon List")),
        ),
        body: BlocBuilder<PokemonApiBloc, PokemonApiState>(
          builder: (context, state) {
            if (state is PokemonListLoaded) {
              return ListView.builder(
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => BlocProvider(
                                  create: (context) => PokemonApiBloc()
                                    ..add(LoadPokemonDetails(
                                        url: state.pokemons[index].detailsURL)),
                                  child: PokemonDetailsScreen(
                                    pokemon: state.pokemons[index],
                                  ),
                                ))));
                      },
                      child: Card(
                        child: Center(
                          child: Text(state.pokemons[index].name),
                        ),
                      )));
            }
            if (state is PokemonApiInitial) {
              return Center(
                child: Text("Loading"),
              );
            } else {
              return const Center(
                child: Text("something went wrong"),
              );
            }
          },
        ));
  }
}
