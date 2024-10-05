import '../models/character.dart';
import '../web/characters_web_service.dart';

class CharactersRepo {
  final CharactersWebService charactersWebService;

  CharactersRepo(this.charactersWebService);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebService.getAllCharacters();
    return characters.map((e) => Character.fromJson(e)).toList();
  }
}
