import 'package:bloc/bloc.dart';
import 'package:character_app_with_bloc/data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/character_model.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;

  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

   List<CharacterModel> characters=[] ;

  List< CharacterModel> getAllCharacters () {
    emit(CharacterLoading());
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharacterSuccess(characterList: characters));
      this.characters=characters;
    });
    emit(CharacterSuccess(characterList: characters));
    return characters;
  }




}
