import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/core/ui_state.dart';
import 'package:pokedex/domain/usecases/get_pokemon_list_use_case.dart';
import 'package:pokedex/presentation/mappers/pokedex_mapper.dart';
import 'package:pokedex/presentation/models/pokemon_model.dart';
import 'package:pokedex/presentation/states/pokedex_event.dart';
import 'package:pokedex/presentation/states/pokedex_state.dart';

@singleton
class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  int currentIndex = 0;
  int maxIndex = -1;
  final GetPokemonListUseCase getPokemonListUseCase;

  PokedexBloc({
    required this.getPokemonListUseCase,
  }) : super(const PokedexState(
            items: [], hasReachedMax: false, uiState: UiState.initial)) {
    on<FetchItems>(_onFetchItems);
    on<RefreshItems>(_onRefreshItems);
  }

  void _onFetchItems(FetchItems event, Emitter<PokedexState> emit) async {
    try {
      if (state.uiState == UiState.loading || state.hasReachedMax) return;
      emit(state.copyWith(uiState: UiState.loading));

      final response = await getPokemonListUseCase.call(currentIndex);
      currentIndex += LOAD_ITEM_COUNT;
      maxIndex = response.count;
      List<PokemonModel> pokemonList =
          response.results.map((pokemon) => pokemon.toModel()).toList();

      emit(state.copyWith(
        items: List.of(state.items)..addAll(pokemonList),
        hasReachedMax: maxIndex != -1 && currentIndex > maxIndex,
        uiState: UiState.success,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(uiState: UiState.failure, error: e));
    }
  }

  void _onRefreshItems(RefreshItems event, Emitter<PokedexState> emit) async {
    try {
      emit(state.copyWith(items: [], hasReachedMax: false, uiState: UiState.loading));

      currentIndex = 0;
      final response = await getPokemonListUseCase.call(currentIndex);
      currentIndex += LOAD_ITEM_COUNT;
      maxIndex = response.count;
      List<PokemonModel> pokemonList =
          response.results.map((pokemon) => pokemon.toModel()).toList();

      emit(state.copyWith(
        items: pokemonList,
        hasReachedMax: false,
        uiState: UiState.success,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(uiState: UiState.failure, error: e));
    }
    
  }
}
