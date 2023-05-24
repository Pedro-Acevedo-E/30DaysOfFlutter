import 'package:day_16_17_pokedex/modules/pokemon/models/pokemon_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../iterator/pokemon_repository.dart';

class PokemonFavoritesBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final _pokemonRepository = PokemonRepository();

  PokemonFavoritesBloc() : super(Empty()) {
    on<FavoriteEvent>(_mapEventToState);
  }

  void _mapEventToState(FavoriteEvent event, Emitter<FavoriteState> emit) async {
    try {
      if(event is AddToFavorites) {
        _pokemonRepository.addPokemonToFavorites(event.pokemon);
        emit(Empty());
      }
      if(event is RemoveFromFavorites) {

      }
      if(event is CheckFavorite) {

      }
      if(event is GetFavorites) {
        print("Getting favorites");
        final list = await _pokemonRepository.getFavoritePokemon();
        if(list.isNotEmpty) {
          emit(FavoriteList(list: list));
        } else {
          emit(NoFavorites());
        }
      }
      if(event is ExitFavorites) {
        emit(Empty());
      }
    } catch (e) {
      emit(FailedToFetch(error: e));
    }
  }
}

abstract class FavoriteState {}
class Empty extends FavoriteState {}
class IsFavorite extends FavoriteState {}
class IsNotFavorite extends FavoriteState {}
class NoFavorites extends FavoriteState {}
class FavoriteList extends FavoriteState {
  List<Map<int, dynamic>> list;

  FavoriteList({required this.list});
}
class FailedToFetch extends FavoriteState {
  Object error;

  FailedToFetch({required this.error});
}


abstract class FavoriteEvent {}

class AddToFavorites extends FavoriteEvent {
  final PokemonInfo pokemon;

  AddToFavorites({required this.pokemon});
}
class CheckFavorite extends FavoriteEvent {
  final int id;

  CheckFavorite({required this.id});
}
class RemoveFromFavorites extends FavoriteEvent {
  final int id;

  RemoveFromFavorites({required this.id});
}
class ExitFavorites extends FavoriteEvent {}
class GetFavorites extends FavoriteEvent {}