import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/domain/entities/pokedex_entity.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';

@singleton
class GetPokemonListUseCase extends UseCase<PokedexEntity, int> {
  final PokedexRepository _pokedexRepository;

  GetPokemonListUseCase({required PokedexRepository pokedexRepository})
      : _pokedexRepository = pokedexRepository;

  @override
  Future<PokedexEntity> call(int params) {
    return _pokedexRepository.getPokemonList(params, params + LOAD_ITEM_COUNT);
  }
}
