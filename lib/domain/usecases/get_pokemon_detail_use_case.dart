import 'dart:async';

import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex/domain/repositories/pokedex_repository.dart';

class GetPokemonDetailUseCase extends UseCase<PokemonEntity, String> {
  final PokedexRepository _pokedexRepository;

  GetPokemonDetailUseCase({required PokedexRepository pokedexRepository})
      : _pokedexRepository = pokedexRepository;

  @override
  Future<PokemonEntity> call(String params) {
    return _pokedexRepository.getPokemonDetail(params);
  }
}
