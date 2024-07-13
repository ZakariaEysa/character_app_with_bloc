import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/character_cubit.dart';
import 'constants/strings.dart';
import 'data/repository/characters_repository.dart';
import 'data/web_services/characters_web_services.dart';
import 'presentation/screens/character_details.dart';
import 'presentation/screens/character_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;

  AppRouter() {
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

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharacterDetails());
    }
    return null;
  }
}
