import '../models/character_model.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository{
  final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<CharacterModel>> getAllCharacters()async{


    List<dynamic> characters = await charactersWebServices.getAllCharacters();

    return characters.map((character)=>CharacterModel.fromJson(character)).toList();




  }



}