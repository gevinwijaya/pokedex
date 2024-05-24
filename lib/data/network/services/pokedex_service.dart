import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class PokedexService {
  final Dio _dio;

  PokedexService({required Dio dio}) : _dio = dio;

  Future<Response<T>> getPokemonList<T>(
      Map<String, String> queryParameters) {
    return _dio.get('https://pokeapi.co/api/v2/pokemon',
        queryParameters: queryParameters);
  }

  Future<Response<T>> getPokemonDetail<T>(String pokemonId) {
    return _dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonId');
  }

  Future<Response<T>> getPokemonDetailThroughurl<T>(String url) {
    return _dio.get(url);
  }
}
