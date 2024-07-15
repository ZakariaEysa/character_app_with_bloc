import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/bloc/simple_bloc_observer.dart';
import 'business_logic/cubit/character_cubit.dart';
import 'constants/strings.dart';
import 'data/models/character_model.dart';
import 'data/repository/characters_repository.dart';
import 'data/web_services/characters_web_services.dart';
import 'presentation/screens/character_details_screen.dart';
import 'presentation/screens/character_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRouter() {

    // CharactersRepository(charactersWebServices: CharactersWebServices()).getQuotes();
    Bloc.observer = SimpleBlocObserver();
    charactersRepository =
        CharactersRepository(charactersWebServices: CharactersWebServices());
    characterCubit = CharacterCubit(charactersRepository);

  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case charactersScreen:
        return MaterialPageRoute(

            builder: (_) => BlocProvider(
                  create: (context) => characterCubit,
                  child: const CharacterScreen(),
                ));

      case characterDetailsScreen:{

        final CharacterModel character = setting.arguments as CharacterModel;


        return MaterialPageRoute(builder: (_) =>  BlocProvider(
            create: (context) =>  CharacterCubit(charactersRepository),
            child: CharacterDetailsScreen(character: character,)));

      }

    }
    return null;
  }
}
