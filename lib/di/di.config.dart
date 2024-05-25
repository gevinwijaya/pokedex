// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokedex/data/datasources/pokedex_remote_data_source.dart'
    as _i5;
import 'package:pokedex/data/network/services/pokedex_service.dart' as _i4;
import 'package:pokedex/data/repositories/pokedex_repository_impl.dart' as _i7;
import 'package:pokedex/di/di.dart' as _i10;
import 'package:pokedex/domain/repositories/pokedex_repository.dart' as _i6;
import 'package:pokedex/domain/usecases/get_pokemon_list_use_case.dart' as _i8;
import 'package:pokedex/presentation/states/pokedex_bloc.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.Dio>(() => registerModule.dio);
    gh.singleton<_i4.PokedexService>(
        () => _i4.PokedexService(dio: gh<_i3.Dio>()));
    gh.singleton<_i5.PokedexRemoteDataSource>(() =>
        _i5.PokedexRemoteDataSource(pokedexService: gh<_i4.PokedexService>()));
    gh.singleton<_i6.PokedexRepository>(() => _i7.PokedexRepositoryImpl(
        pokedexRemoteDataSource: gh<_i5.PokedexRemoteDataSource>()));
    gh.singleton<_i8.GetPokemonListUseCase>(() => _i8.GetPokemonListUseCase(
        pokedexRepository: gh<_i6.PokedexRepository>()));
    gh.singleton<_i9.PokedexBloc>(() => _i9.PokedexBloc(
        getPokemonListUseCase: gh<_i8.GetPokemonListUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i10.RegisterModule {}
