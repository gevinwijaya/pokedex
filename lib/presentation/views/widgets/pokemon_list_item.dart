import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/presentation/models/pokemon_model.dart';

class PokemonListItem extends StatelessWidget {
  static const double _pokemonFraction = 0.6;

  final PokemonModel pokemon;
  final void Function()? onPress;

  const PokemonListItem(
    this.pokemon, {
    super.key,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: pokemon.color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: pokemon.color.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: pokemon.color,
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPokemon(height: itemHeight),
                    _buildPokemonNumber(),
                    _CardContent(pokemon),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPokemon({required double height}) {
    final pokemonSize = height * _pokemonFraction;

    return Positioned(
      bottom: 8,
      right: 8,
      child: SvgPicture.network(
        width: pokemonSize,
        height: pokemonSize,
        pokemon.imageUrl,
        placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildPokemonNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        pokemon.id,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black26,
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final PokemonModel pokemon;

  const _CardContent(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Hero(
                tag: pokemon.id + pokemon.name,
                child: Text(
                  pokemon.name,
                  style: const TextStyle(
                    fontSize: 20
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ..._buildTypes(context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTypes(BuildContext context) {
    return pokemon.types
        .take(2)
        .map(
          (type) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: _typeTag(type),
          ),
        )
        .toList();
  }
}

Widget _typeTag(String type) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Text(
      type,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12.0,
      ),
    ),
  );
}

