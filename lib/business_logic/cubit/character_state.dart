part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}
final class CharacterLoading extends CharacterState {}
final class CharacterSuccess extends CharacterState {
  final  List<CharacterModel> characterList;

  CharacterSuccess({required this.characterList});


}
final class CharacterFailure extends CharacterState {
  CharacterFailure({required this.message});

  final String message;

  @override
  String toString() => 'CharacterFailure { message: $message }';}


