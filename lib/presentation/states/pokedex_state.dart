import 'package:equatable/equatable.dart';
import 'package:pokedex/core/ui_state.dart';
import 'package:pokedex/presentation/models/pokemon_model.dart';

class PokedexState extends Equatable {
  final List<PokemonModel> items;
  final bool hasReachedMax;
  final UiState uiState;
  final Exception? error;

  const PokedexState(
      {required this.items,
      required this.hasReachedMax,
      required this.uiState,
      this.error});

  PokedexState copyWith({
    List<PokemonModel>? items,
    bool? hasReachedMax,
    UiState? uiState,
    Exception? error
  }) {
    return PokedexState(
      items: items ?? this.items,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      uiState: uiState ?? UiState.initial,
      error: error
    );
  }

  @override
  List<Object> get props => [items, hasReachedMax, uiState];
}
