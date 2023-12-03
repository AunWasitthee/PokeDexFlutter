import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/domain/domain.dart';

import '../../utils/constants.dart';
import '../presentation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white60,
        title: const Text(
          "PokeDex",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const SafeArea(
        child: ListPokemons(),
      ),
    );
  }
}

class ListPokemons extends StatefulWidget {
  const ListPokemons({super.key});

  @override
  State<ListPokemons> createState() => _ListPokemonsState();
}

class _ListPokemonsState extends State<ListPokemons> {
  late PokemonsBloc pokeBloc;
  List<PokemonEntity> allPokemonList = [];

  final _scrollController = ScrollController();
  bool scrollSwitch = true;

  void _onScroll() {
    if (_isBottom && scrollSwitch) {
      scrollSwitch = false;
      context.read<PokemonsBloc>().add(GetPokemonAll(allPokemonList.length));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    allPokemonList = [];
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pokeBloc = BlocProvider.of<PokemonsBloc>(context);

    return BlocBuilder<PokemonsBloc, PokemonsState>(
        bloc: pokeBloc,
        builder: (context, state) {
          if (state is PokemonsInitial) {
            pokeBloc.add(GetPokemonAll(allPokemonList.length));
            return const Center(child: CircularProgressIndicator());
          } else if (state is HavePokemonsState) {
            scrollSwitch = true;
            allPokemonList.addAll(state.pokemons);

            return Container(
              color: Colors.white60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  controller: _scrollController,
                  itemCount: allPokemonList.length,
                  itemBuilder: (context, index) {
                    return index >= allPokemonList.length
                        ? const Center(child: CircularProgressIndicator())
                        : ListTile(
                            title: PokemonCard(pokemon: allPokemonList[index]),
                          );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                            Orientation.landscape)
                        ? 4
                        : 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 8,
                  ),
                ),
              ),
            );
          }
          return const Center();
        });
  }
}

class PokemonCard extends StatefulWidget {
  final PokemonEntity pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late String id;

  @override
  void initState() {
    super.initState();
    id = widget.pokemon.id.toString().padLeft(3, '0');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            // color: colorByType(widget.pokemon.types?[0] ?? '')
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '#$id',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Image.network(
                widget.pokemon.imgUrl ?? '',
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.pokemon.types?.map(
                          (e) {
                            return Container(
                              color: colorByType(e),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                e,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            );
                          },
                        ).toList() ??
                        [],
                  ),
                  Text(
                    widget.pokemon.name ?? '',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PokemonDetailPage(pokemon: widget.pokemon),
            ),
          );
        });
  }
}
