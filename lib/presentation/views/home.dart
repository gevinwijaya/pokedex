import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/ui_state.dart';
import 'package:pokedex/presentation/models/pokemon_model.dart';
import 'package:pokedex/presentation/states/pokedex_bloc.dart';
import 'package:pokedex/presentation/states/pokedex_event.dart';
import 'package:pokedex/presentation/states/pokedex_state.dart';
import 'package:pokedex/presentation/views/widgets/pokedex_loader.dart';
import 'package:pokedex/presentation/views/widgets/pokemon_list_item.dart';
import 'package:pokedex/route/application_router.gr.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokedexBloc _pokedexBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _pokedexBloc = BlocProvider.of<PokedexBloc>(context);
    _scrollController.addListener(_onScroll);
  }

  void _checkContentHeight() {
    if (_scrollController.position.maxScrollExtent <=
        _scrollController.position.viewportDimension &&
        _pokedexBloc.state.uiState != UiState.loading &&
        !_pokedexBloc.state.hasReachedMax) {
      _pokedexBloc.add(FetchItems());
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _pokedexBloc.state.uiState != UiState.loading &&
        !_pokedexBloc.state.hasReachedMax) {
      _pokedexBloc.add(FetchItems());
    }
  }

  void _onItemPress(PokemonModel pokemon) {
    context.router.push(PokemonDetailRoute(pokemon: pokemon));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            scrolledUnderElevation: 0.0,
            toolbarHeight: 60.0,
            title: const Text(
              'Pokedex',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return BlocBuilder<PokedexBloc, PokedexState>(
              builder: (context, state) {
                WidgetsBinding.instance.addPostFrameCallback((_) => _checkContentHeight());
                if (state.uiState == UiState.loading && state.items.isEmpty) {
                  return const Center(
                      child: PokedexLoader());
                }

                if (state.uiState == UiState.failure) {
                  return Center(child: Text('Error: ${state.error}'));
                }

                int crossAxisCount =
                    orientation == Orientation.portrait ? 2 : 3;

                return RefreshIndicator(
                    onRefresh: () async {
                      _pokedexBloc.add(RefreshItems());
                    },
                    child: Stack(
                      children: [
                        GridView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _scrollController,
                          padding: const EdgeInsets.all(20.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: 16.0,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: 1.3,
                          ),
                          itemCount: state.items.length +
                              (state.uiState == UiState.loading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index < state.items.length) {
                              return PokemonListItem(
                                state.items[index],
                                onPress: () => _onItemPress(state.items[index]),
                              );
                            }
                            return null;
                          },
                        ),
                        if (state.uiState == UiState.loading &&
                            state.items.isNotEmpty)
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.transparent,
                              child: const Center(
                                child: PokedexLoader(),
                              ),
                            ),
                          ),
                      ],
                    ));
              },
            );
          },
        ));
  }
}
