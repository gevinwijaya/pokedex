import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/presentation/models/pokemon_model.dart';
import 'package:pokedex/presentation/views/widgets/about_tab.dart';
import 'package:pokedex/presentation/views/widgets/base_stats_tab.dart';
import 'package:pokedex/presentation/views/widgets/moves_tab.dart';

@RoutePage()
class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pokemon.color,
      body: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 20.0, left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemon.name,
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _getTags(pokemon.types),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      pokemon.id,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 30.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30.0)),
                    ),
                  ),
                  OrientationBuilder(
                    builder: (context, orientation) {
                      if (orientation == Orientation.portrait) {
                        return SvgPicture.network(
                          pokemon.imageUrl,
                          height: 150.0,
                          width: 150.0,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    const TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Colors.blue,
                      tabs: [
                        Tab(text: 'About'),
                        Tab(text: 'Base Stats'),
                        Tab(text: 'Moves'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          AboutTab(about: pokemon.about),
                          BaseStatsTab(baseStats: pokemon.baseStats),
                          MovesTab(moves: pokemon.moves),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _getTags(List<String> types) {
  List<Widget> widgetList = List.empty(growable: true);
  for (var type in types) {
    widgetList.add(_typeTag(type));
    widgetList.add(const SizedBox(width: 4.0,));
  }
  return widgetList;
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
        fontSize: 16.0,
      ),
    ),
  );
}

Widget _placeholderTab(String label) {
  return Center(
    child: Text(
      label,
      style: TextStyle(fontSize: 24.0, color: Colors.black54),
    ),
  );
}