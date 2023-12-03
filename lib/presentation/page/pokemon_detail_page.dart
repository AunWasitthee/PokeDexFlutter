import 'package:flutter/material.dart';
import 'package:pokedex_flutter/domain/domain.dart';

import '../../utils/constants.dart';

class PokemonDetailPage extends StatefulWidget {
  final PokemonEntity pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        alignment: Alignment.center,
                        child: Text(
                          '${widget.pokemon.name?.toUpperCase() ?? ''} #${widget.pokemon.id.toString().padLeft(3, '0')}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                height: 250,
                alignment: Alignment.center,
                child: Image(
                  image: NetworkImage(widget.pokemon.imgUrl ?? ''),
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pokemon.types?.map(
                      (e) {
                        return Container(
                          color: colorByType(e),
                          padding: const EdgeInsets.symmetric(horizontal: 4),
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
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                child: IntrinsicHeight(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    columnValueText('Height', widget.pokemon.height ?? 0),
                    const VerticalDivider(
                      color: Colors.black,
                      thickness: 4,
                    ),
                    columnValueText('Weight', widget.pokemon.weight ?? 0),
                  ],
                )),
              )
              // InfoStats(pokemon)
            ],
          ),
        ));
  }

  Widget columnValueText(String description, int value) {
    return Container(
      margin: const EdgeInsets.only(right: 15, left: 15),
      child: Column(
        children: [
          AnimatedCounter(
            value: value,
            primaryColor: Colors.brown,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class AnimatedCounter extends StatelessWidget {
  const AnimatedCounter(
      {required this.value, required this.primaryColor, super.key});

  final int value;
  final MaterialColor primaryColor;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: value),
      duration: const Duration(seconds: 2),
      builder: (context, value, child) => Text("$value",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor),
          textAlign: TextAlign.center),
    );
  }
}
