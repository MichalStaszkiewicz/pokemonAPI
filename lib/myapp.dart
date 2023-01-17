import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/bloc/pokemon_api_bloc.dart';
import 'package:pokeapi/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BlocProvider(
        create: (context) => PokemonApiBloc()..add(PokemonFetchData()),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
