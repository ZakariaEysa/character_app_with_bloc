import 'package:bloc/bloc.dart';
import '../../data/models/quotes_model.dart';
import '../../data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/character_model.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository  charactersRepository ;
  List<CharacterModel> characters = [];

  CharacterCubit(
      this.charactersRepository,
      ) : super(CharacterInitial());

  List<CharacterModel> getAllCharacters() {

    emit(CharacterLoading());
    charactersRepository.getAllCharacters().then(
          (characters) {
        emit(CharacterSuccess( characterList:characters));

        this.characters = characters;
      },
    );
    return characters;
  }


  void getQuotes() {
    charactersRepository.getQuotes().then(
          (quote) {
        emit(QuotLoaded(quote: quote));
      },
    );
  }



}
