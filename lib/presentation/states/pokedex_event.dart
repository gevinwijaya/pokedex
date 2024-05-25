import 'package:equatable/equatable.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();

  @override
  List<Object> get props => [];
}

class FetchItems extends PokedexEvent {}

class RefreshItems extends PokedexEvent {}