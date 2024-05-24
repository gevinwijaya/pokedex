import 'dart:async';

import 'package:pokedex/constants.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';

class GetPokemonListUseCase extends UseCase<List<PokemonEntity>, int> {
  final PokedexRepository _pokedexRepository;

  GetPokemonListUseCase({required PokedexRepository pokedexRepository})
      : _pokedexRepository = pokedexRepository;

  @override
  Future<List<PokemonEntity>> call(int params) {
    return _pokedexRepository.getPokemonList(params, params + LOAD_ITEM_COUNT);
  }
}
